Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DB36D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:16:11 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id e3so10015843qte.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r0JJK8fDOBJh9zQ9xtXbOYn4ZOw91G+oEFwKabwQczg=;
        b=SnEFRG4pcAtqk2eMJGOiHSuVbgFd1QuW6HzPDMRKjwNhbCVwxU4kFA5DAYIXk1SLwA
         9/CNOwoTfPkEcK9zhCvAP1P/qGoljrCPLXXBFjg61K23ZHAECjXJdd3B9MaAkB4KRqFV
         Nl7sirBqXgI75nVir3j5rvyrOCimz5wV96Uy8CJIdKJwJHYf7oVmvQYUHS7jFsBRAy+t
         lEIOOsxZGfKQfSiVE35s5cp5he+N8/WTws9QLP7Xs3npIf9GYAMDSzcJhUypuFb/k2D0
         LQqTSgAcnwxREFXWfSogO2pwNS+wfPcomDzbIENJMSSKDvnW6SWdJproyMAeVa/D1diK
         FKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r0JJK8fDOBJh9zQ9xtXbOYn4ZOw91G+oEFwKabwQczg=;
        b=gQC0mQ/N1JbOTooIi7ZvqSiwe50odoesEJk1DcdnS1pIHAvEI9C8LnXAezfqoT0ITp
         UexwSlx3yK3fjLy0QHlEGkdjOW5bxnm/PZg0E6pOdnHfICMSPcPT8rP5yO4D/11RPzR3
         g3+b9UoRRvufyWO/nWlamHyGlL8txUDO/jXaG6wRIaOWPKPJE2i2QZB+0iFM+4k8hM7O
         mXK7xyRJqoSvDXZdNmNCBRYiuMWvLaZhQ+pKrp81O9/BjCdaWMCh/V6AVDO1ghsSVfPR
         FXKHIx1Q72PI2Nzr7mx7r13b46LEVniHBKfHZ1NKNueWiHDzQiGuIzdAS+PP3BXZ+VPz
         47NQ==
X-Gm-Message-State: AOAM532drh/XLCgs0UZPvZP3B6urlvcfvPpaO30DZhWYo8JvJ8yNfHUv
	urCkzMpg8nYjTdF1at2OV6cZxg==
X-Google-Smtp-Source: ABdhPJy4C0Ko8XPTsxWR10re2ykvUSyH9XIdNzjeSyZGM6w6RoPkBBmGcu0DEDMnew6pvNIJTiQyoA==
X-Received: by 2002:ac8:5d47:: with SMTP id g7mr6698738qtx.351.1623716170337;
        Mon, 14 Jun 2021 17:16:10 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:16:10 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 16/28] staging: rtl8188eu: remove all DBG_88E calls from os_dep/rtw_android.c
Date: Tue, 15 Jun 2021 01:14:55 +0100
Message-Id: <20210615001507.1171-17-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from os_dep/rtw_android.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/os_dep/rtw_android.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/rtw_android.c b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
index 99475be30702..298517530ed3 100644
--- a/drivers/staging/rtl8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
@@ -135,8 +135,6 @@ int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
 	if (IS_ERR(command))
 		return PTR_ERR(command);
 	command[priv_cmd.total_len - 1] = 0;
-	DBG_88E("%s: Android private cmd \"%s\" on %s\n",
-		__func__, command, ifr->ifr_name);
 	cmd_num = rtw_android_cmdstr_to_num(command);
 	switch (cmd_num) {
 	case ANDROID_WIFI_CMD_START:
@@ -202,7 +200,6 @@ int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
 	case ANDROID_WIFI_CMD_P2P_SET_PS:
 		break;
 	default:
-		DBG_88E("Unknown PRIVATE command %s - ignored\n", command);
 		snprintf(command, 3, "OK");
 		bytes_written = strlen("OK");
 	}
@@ -211,20 +208,14 @@ int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
 	if (bytes_written >= 0) {
 		if ((bytes_written == 0) && (priv_cmd.total_len > 0))
 			command[0] = '\0';
-		if (bytes_written >= priv_cmd.total_len) {
-			DBG_88E("%s: bytes_written = %d\n", __func__,
-				bytes_written);
+		if (bytes_written >= priv_cmd.total_len)
 			bytes_written = priv_cmd.total_len;
-		} else {
+		else
 			bytes_written++;
-		}
 		priv_cmd.used_len = bytes_written;
 		if (copy_to_user((char __user *)priv_cmd.buf, command,
-				 bytes_written)) {
-			DBG_88E("%s: failed to copy data to user buffer\n",
-				__func__);
+				 bytes_written))
 			ret = -EFAULT;
-		}
 	} else {
 		ret = bytes_written;
 	}
-- 
2.30.2

