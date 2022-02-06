Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DEC2F28
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 22:59:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v19so6811851wrv.6
        for <linux-staging@lists.linux.dev>; Sun, 06 Feb 2022 14:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtVyQ9OIy3W70tzrc/QwpbNSPSmW2PK9iGxGNB2+tTg=;
        b=KRtfiJN2D4GP5yydji7nB7zqBvhBqjbIcYQEuTQz6Or/omSyf0Fe+YjEEYDi0YzC7n
         8phn+krhMrLfwS/X9mniksXur3a4QmvXpXNGQ1bj/JvJZ9rn1Mr7WAu2ESNvNutdzgN8
         uLmCEVtVudeqYl1+8nAC8XmzIKPemhDx4HcMNQHfRUSb40l3zi8Ri+6lEPMfla8v2kkh
         xuewyJjMt9PLytwIjMqvAF/nMTik/27PIb1rBc/KbZKyRqE4Cl3nqeUluWCzwleyu+Ma
         dLCvHGft9HYYdpuvfdxLXiXQDy5T1XXECMqnIM6OR5rKNjVAEfkeWkQ6fV9kB07YOVMI
         OsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtVyQ9OIy3W70tzrc/QwpbNSPSmW2PK9iGxGNB2+tTg=;
        b=38upKujsibwQ7gKJRXVWk55DgSaA2PtKdVoyov3OoN2u0sw+8xl/VlnMbmlaIYDYky
         hdJ6PTJRCtdO5PmMijaIYHjUm0zMP1WpeGI3K586KsiYEnnlbLsaM4tFPgG0q0fPPysT
         MBNAqkxW2p4Aazdza5q8jUuj3J+iLc7Npyopz2bbcHlrJDl8L/Bxg/r/JQwAuq+QW8av
         MB5Z/N70Bdyhbp1fXEVJu89ajGaiCRcwKTsgsvZKDpqY8kyXw10NVwYxuHgqoyyBrsmI
         nRvQNgksxavF7hzj+JxL4t6ZO8nqNyUrG/QvAO8+tumSB6ucSUBKkmdIa3SlCX6NYEhq
         9jaA==
X-Gm-Message-State: AOAM533Ins7b+j73hklsP6DXXTARw9BK0SiH57yPjGxym7o6FjLVfz6G
	25KeLcsb0TkfecWwJQuLpLM=
X-Google-Smtp-Source: ABdhPJyzaTXFCeSv21+oGxPjW6XSMiy3B1J9oEUIlUz5u21K5Yy3zXd4MdZXDWana+2InS7ugB7IGw==
X-Received: by 2002:adf:eac5:: with SMTP id o5mr7914359wrn.655.1644188390463;
        Sun, 06 Feb 2022 14:59:50 -0800 (PST)
Received: from localhost.localdomain (host-95-245-2-16.retail.telecomitalia.it. [95.245.2.16])
        by smtp.gmail.com with ESMTPSA id t18sm8514637wri.34.2022.02.06.14.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 14:59:49 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Sun,  6 Feb 2022 23:59:43 +0100
Message-Id: <20220206225943.7848-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in
rtw_set_key(). This function is called while holding spinlocks and with
disabled bottom halves, therefore it is not allowed to sleep. With the
GFP_ATOMIC type flag, the allocation is high priority and cannot sleep.

This issue is detected by Smatch which emits the following warning:
drivers/staging/r8188eu/core/rtw_pwrctrl.c:79 ips_leave() warn: sleeping in atomic context
drivers/staging/r8188eu/core/rtw_pwrctrl.c:81 ips_leave() warn: sleeping in atomic context

The calls chain (in reverse order) is the following:

rtw_set_key()
-> ips_leave()
-> -> rtw_pwr_wakeup()
-> -> -> rtw_set_802_11_disassociate()

The disabilitation of bottom halves and the acquisition of a spinlock is in
rtw_set_802_11_disassociate().

After the changes, the post-commit hook output the following messages:

CHECK: Prefer kzalloc(sizeof(*pcmd)...) over kzalloc(sizeof(struct cmd_obj)...)
+       pcmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);

CHECK: Prefer kzalloc(sizeof(*psetkeyparm)...) over kzalloc(sizeof(struct setkey_parm)...)
+       psetkeyparm = kzalloc(sizeof(struct setkey_parm), GFP_ATOMIC).

According to the above "CHECK[S]", use the preferred style in the first
kzalloc().

Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for kalloc() and kzalloc()")
Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 038bddc361c3..860835e29b79 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1600,12 +1600,12 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
 	struct mlme_priv		*pmlmepriv = &adapter->mlmepriv;
 	int	res = _SUCCESS;
 
-	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd = kzalloc(sizeof(*pcmd), GFP_ATOMIC);
 	if (!pcmd) {
 		res = _FAIL;  /* try again */
 		goto exit;
 	}
-	psetkeyparm = kzalloc(sizeof(struct setkey_parm), GFP_KERNEL);
+	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_ATOMIC);
 	if (!psetkeyparm) {
 		kfree(pcmd);
 		res = _FAIL;
-- 
2.34.1

