Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7113FCC
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 16:34:29 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id q23so10756158pfs.9
        for <linux-staging@lists.linux.dev>; Sat, 02 Oct 2021 09:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=wLb2A0PtJlB17tyLyjs2uzTuOP43MV6eb3/hU3RQqhE=;
        b=QHB5X2UHQEkRlzsC39y2neBg6czGLrOigMaMM0ZU/KthuJ132gk2nQSZOn8QGiO8R5
         4tGvRCpYKKxuKdIXyDldB/YZkvWscrj5eJGq4jDCYW1eq2Gn+6mDj/F6POynyNgOhkNc
         Sqvskuu8sYxenRuSjPx5SnvM15QH0DwxAONHIoJzrmeBYtCM4WM7czjTLRuJVrR/+iDs
         uA9U731NC4TWDHsqN86Ie4x2nIorq3SasLVV2XHbebP82K1V0733EsSwIQ2bpwSBrptt
         kBPS9PCNlcHlgEqIutxMhaboWioceLctW00/klC6NB7fTBNk0KBIrhROMoO2R0rDpy0c
         XMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wLb2A0PtJlB17tyLyjs2uzTuOP43MV6eb3/hU3RQqhE=;
        b=37gyf00nAxVC1CLrQm8guhOyCniEH3GYgFIdWNYngQQQAjCtyqCctSeexlGag4ak0g
         JH3nm62LQBNlbIwQ52PHyJNlg55leAiSmfgLj3hpdWeMjqTjJN8ANqxusPpn3Vqa1/KI
         AXN8fjgXwqcGs191YHNhwpyRiSSHZHNG0bKVGolWZHjJ40qJkzkuUUtk6BArGSRCm8ea
         4QpJtb11kL+vwo8rHZmf+anIolUTofprtBZoXsXs26Hj5jwsgIGPaOR5lUkrW6DXPYyC
         Dt/jVp5Z72cdI8iVkOZKVSNq+EiX9btv4vReCBYeB8kFnkgcs4aoIy/S8T6m+mSCN7Bd
         n+pA==
X-Gm-Message-State: AOAM531Ejt6WB9nUWCGYAKjabelamsqBKyYju3CA9os8mC+9t4ajr8R/
	KloqdSA3SHAciWuy2mupfSM=
X-Google-Smtp-Source: ABdhPJx2qUsUSk9/7hEBy2obN0pznxb2BpCV+tjFYypJVOO/yl8M+7NPeZmfH7YpiQJUSO3piuOQDA==
X-Received: by 2002:a63:d64c:: with SMTP id d12mr3502461pgj.186.1633192468617;
        Sat, 02 Oct 2021 09:34:28 -0700 (PDT)
Received: from user ([223.230.105.60])
        by smtp.gmail.com with ESMTPSA id p2sm9874131pgd.84.2021.10.02.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 09:34:28 -0700 (PDT)
Date: Sat, 2 Oct 2021 22:04:23 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v2] staging: r8188eu: core: remove unused variable pAdapter
Message-ID: <YViKDzqX5isFX+gv@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variable pAdapter in Efuse_Read1ByteFromFakeContent.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---

ChangeLog V2:
	-Remove unneeded line break on Efuse_Read1ByteFromFakeContenit().

ChangeLog V1:
	-Remove unused variable pAdapter in Efuse_Read1ByteFromFakeContent.

 drivers/staging/r8188eu/core/rtw_efuse.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 801887f497cf..225ebdee21c1 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -28,9 +28,7 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */

-static bool Efuse_Read1ByteFromFakeContent(struct adapter *pAdapter,
-					   u16 Offset,
-					   u8 *Value)
+static bool Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
 		return false;
@@ -96,7 +94,7 @@ ReadEFuseByte(
 	u16 retry;

 	if (pseudo) {
-		Efuse_Read1ByteFromFakeContent(Adapter, _offset, pbuf);
+		Efuse_Read1ByteFromFakeContent(_offset, pbuf);
 		return;
 	}

@@ -134,7 +132,7 @@ u8 efuse_OneByteRead(struct adapter *pAdapter, u16 addr, u8 *data, bool pseudo)
 	u8 result;

 	if (pseudo) {
-		result = Efuse_Read1ByteFromFakeContent(pAdapter, addr, data);
+		result = Efuse_Read1ByteFromFakeContent(addr, data);
 		return result;
 	}
 	/*  -----------------e-fuse reg ctrl --------------------------------- */
--
2.32.0

