Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F23FCB
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 15:46:31 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so2705043pjt.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=orYg9WhXU6LamUpPHbvyglJpY6TmtDwaRBuxFjtRHsQ=;
        b=SZieHhiquyxl/pFNCH15FSG/VpbZHUdbbIMOey3CtwaxnlpKgFILyoeR9Ja5mqDL10
         iM/jmZ8KjaN+icB+kbAwcndKFVczbD1MmW/yoj3nLQZEzm5abYwdXF+69i/ETRT8MMbh
         WOSDC/t1QgRs37bFV7IQ16iZnE4GXI/+7yc1K5KHo4exQyyFQ7qsGTbHrU801QvKhGuk
         aRq3anck0JnfSLAl4T7FHg6tj4udF2BLX0Nvly/OsZUH8JIHBpSKkXeBd13LDJYRjFEm
         oHbcfpkGOjTh9oYaRckyH32IB/Eal6BgT41jn15xkGccwnLno0eVKGX3k2h01njSJ37g
         IGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=orYg9WhXU6LamUpPHbvyglJpY6TmtDwaRBuxFjtRHsQ=;
        b=KaT6WivkdpMrxqt+8bJRJaaO8lUU7Rmwnz/aVH4YXW3Bicnb5kP7tlrRrmhUEj3OLi
         2MdHGjrkKmBz6Zlxow+/LkejstPg1c7nld0hpGrXVpa6MCTb3uOPXR8Stk714FFJyd5w
         0v10gaAgkJr5vX0pYnlfQ9YsorGQATmMm7/1Ecc8CQ42CYqIxklrx3hTujolkUKvNK0o
         TEtD7md9t0bBg2TY0s7XfoJZH+ZcfaJiSvzaYlchm0fQqnOJCAmj/lgzesDKIq64S+0l
         /dIPEvb1EBWzL5ohqdCgCZFKRmxPI2vrdYjj4/76ITpX/AMrTASgie9lT1LfFV0D9uT1
         FmWg==
X-Gm-Message-State: AOAM530FDapWqJtlbwV00PpZkNnABIIcjZXdm7CChnJ0f9/pdf+6oUq4
	3AL/GIW/jF0Ikni59wyBRiM=
X-Google-Smtp-Source: ABdhPJzDTrhA65210RX8xMhY6wNPQQks306FL40SouNK1Inmobb7UuUqMoM/s9JdeGfNjgMCkx2Sdg==
X-Received: by 2002:a17:902:edd7:b0:136:9429:d148 with SMTP id q23-20020a170902edd700b001369429d148mr4065836plk.33.1629992791064;
        Thu, 26 Aug 2021 08:46:31 -0700 (PDT)
Received: from localhost.localdomain ([222.205.124.103])
        by smtp.gmail.com with ESMTPSA id p10sm3593898pjv.39.2021.08.26.08.46.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Aug 2021 08:46:30 -0700 (PDT)
From: Wenlong Zhang <yixiaonn@gmail.com>
To: gregkh@linuxfoundation.org
Cc: fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	insafonov@gmail.com,
	cyruscyliu@gmail.com,
	yajin@vm-kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Wenlong Zhang <yixiaonn@gmail.com>
Subject: [PATCH] staging: rtl8723bs: prevent ->ssid overflow in rtw_wx_set_scan()
Date: Thu, 26 Aug 2021 23:46:22 +0800
Message-Id: <20210826154622.55361-1-yixiaonn@gmail.com>
X-Mailer: git-send-email 2.15.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Commit 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
fixed up the staging driver rtl8188eu by adding another check 
to prevent writing beyond the end of the ->ssid[] array.

Resolve this by properly fixing up the rtl8723bs driver's version of
rtw_wx_set_scan() 

Reported-by: Wenlong Zhang(iLifetruth) <yixiaonn@gmail.com>
Fixes: 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")

Signed-off-by: Wenlong Zhang <yixiaonn@gmail.com>

---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 902ac8169948..6fc1020cea11 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1351,9 +1351,9 @@ static int rtw_wx_set_scan(struct net_device *dev, struct iw_request_info *a,
 
 					sec_len = *(pos++); len -= 1;
 
-					if (sec_len > 0 && sec_len <= len) {
+					if (sec_len > 0 && sec_len <= len && sec_len <= 32) {
 						ssid[ssid_index].SsidLength = sec_len;
-						memcpy(ssid[ssid_index].Ssid, pos, ssid[ssid_index].SsidLength);
+						memcpy(ssid[ssid_index].Ssid, pos, sec_len);
 						/* DBG_871X("%s COMBO_SCAN with specific ssid:%s, %d\n", __func__ */
 						/* 	, ssid[ssid_index].Ssid, ssid[ssid_index].SsidLength); */
 						ssid_index++;
-- 
2.15.0

