Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EBF70
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:34 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id l18so21535522edc.9
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JF/B2DTWQj/w/voWt1Q8G3VMWTtinDgQ1FwmaBkjzU=;
        b=Xchwqom267MoYT/kxUcurJ2fxRasvFUK4ZiUaB3GhuPMqxJ76SBQEYvyGnc1mOWYWz
         M5KXmPDuTgHWOzjlWhyHQoFDJYLyQ9CD49YPHzqbyym1REvMay1xaHutSDtQY/boP/lc
         yD4V748eYQTrhHaydBViY5JnLUxZfZIk7xJ+TqZndkIciPoFGH5lUT5P482TkO4P7Ml5
         vyUkrl0zCjj5y/po22B+/7VXPY+mHSi+8aPltwNpTmHFopdzcDnnMqalt3sgX9nroxXw
         gXih9OH3s23pi/Kwx9JLbbybB60jVac61sWu8NEWNAFJGD+4TC+zrbnVfpE+UDJzqgAK
         G2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JF/B2DTWQj/w/voWt1Q8G3VMWTtinDgQ1FwmaBkjzU=;
        b=Dz/UA4C6Zuda7Eq/loYMZ45mArC36dnzuz82992GddIh3gyIIEucMm/zUW8/ww48k9
         z703Ne5vxnAgio/SWyl63v9Pa5IFmRb9DiUgTg70pRLTLdyLdns+v2tyibKZAwpHgGVn
         880/KrEi1uXMQN4DvP71UPP0CAhXuSJIdGoJj+o57DzoZIRM43GvyGtnxXbDKfVAKvEO
         cSS5qIEMX2voODlJUGIjeJAurE0LRi83TkNciebVNlCe9CwgEaCE27Kb1LcZPDHKZOhC
         8zhGXjH8qjC7Qt9NbIqOBX+NGgy6vc8C5JpIGxJofEO/5TEkieHQ+vYLF+DL6tFX2PKk
         CeOQ==
X-Gm-Message-State: AOAM532D+LCqGaKujzILS9iKK3nofel5gDWgGnVp3g3biVsV3aZ9yxI6
	WC0lhkaAsywbehfO4vjrV10=
X-Google-Smtp-Source: ABdhPJzO8ZLbrtJXXI0WJntQYM6nbtdbUh6ttzd2nf3+P++hizNok3aA+t+jT5hCHjYMx4ERrdyhqQ==
X-Received: by 2002:aa7:da48:: with SMTP id w8mr2496933eds.81.1617183632812;
        Wed, 31 Mar 2021 02:40:32 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id q16sm849465ejd.15.2021.03.31.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 11/40] staging: rtl8723bs: remove commented RT_TRACE call in core/rtw_ioctl_set.c
Date: Wed, 31 Mar 2021 11:39:39 +0200
Message-Id: <9f86621a574ce979e907384f0fc94425b7b63123.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE call in core/rtw_ioctl_set.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 7d858cae2395..14eb01df69b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -451,9 +451,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		/* SecClearAllKeys(adapter); */
 
-		/* RT_TRACE(COMP_OID_SET, DBG_LOUD, ("set_infrastructure: fw_state:%x after changing mode\n", */
-		/* 									get_fwstate(pmlmepriv))); */
-
 		spin_unlock_bh(&pmlmepriv->lock);
 	}
 	return true;
-- 
2.20.1

