Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060CF3FDE
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 15:13:58 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id w11so8215440plz.13
        for <linux-staging@lists.linux.dev>; Sat, 02 Oct 2021 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3CcsIBkjnD7sDWaAM5mdqO8LXPHUnsgkAUC6h+d4KEk=;
        b=J15ChbwXUVu9rh26SHqVY8sa3JxBfK6+NkF3P+sW6CoB7qKhOr0DCh+uWiNSgdfVmn
         2UlJbZNPi1qqbaR2ZodVYqfPRsfBQK98sE1sXV+y/9WSsbE/vh+fTHbV5uacQW8e0gwF
         SwbkM6yq7TuRa+JpqAfsqGTCvs7cQk4rb+a/O7oZmu5EG8iF6j1oWjDNKiwTQ0JzxWSi
         fP//HwDl+cjmVDKh+bQKU0YJk4vFp0ijv+l/5XNshglCev+EraQCX5LMVV2M3fbNmtbU
         4e+eqWBHNXExmEQF6sLqhCdODyRWJOCRFwhBVvqKRZcIUc+EIPkHJoFDP7HnXe/hRcd3
         TnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3CcsIBkjnD7sDWaAM5mdqO8LXPHUnsgkAUC6h+d4KEk=;
        b=68WBaaqaLKxhk8HuGi4sHx/3JkA/X2Bv9FRhXy9ZLqlZA/07cm4sSgamMnz4+ClutL
         x2JRlWveiD5a6aB0ZWb3ice1mSDyN5RcAtjkxeS4t0e3xe9pg9cDhc8jipC3Up3XUaUw
         8lFwa3Gxv6y0oebX2i0moFVS+rgyZjQ896OxgH/OFUtM6/oS5weVadGOZrk9Xw+kSHEF
         98PTU0VwYFXop3YghuDy/zXZbs5Dp20iRE7tPC8wxWlvVAjNN3jTzzdK6L88ESyY1Pxj
         CR9Gm/q+F2DKhpoUANlDymTEE8JoWD/LiW65prbydy1Be3v7jBthEDDKDISi5cZE7S9w
         /l3w==
X-Gm-Message-State: AOAM5323QFth3WnBdsdUo+dLzMPBQ2ccsaowKqhcGHEpsC1c+32CpQbz
	g0MXx4wHau/8M8QjsWx0WpfcODawLUw=
X-Google-Smtp-Source: ABdhPJyCmF7HojIrD01MKnEYPyf/gWuUwhD9TDFQCO8AAPjwSrA9JATjobIyQV7V4jpi9Ir+BFnKMg==
X-Received: by 2002:a17:902:dad2:b0:13c:a6ce:faea with SMTP id q18-20020a170902dad200b0013ca6cefaeamr15873437plx.45.1633187638437;
        Sat, 02 Oct 2021 08:13:58 -0700 (PDT)
Received: from user ([223.230.105.60])
        by smtp.gmail.com with ESMTPSA id k22sm9472702pfi.149.2021.10.02.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 08:13:58 -0700 (PDT)
Date: Sat, 2 Oct 2021 20:43:52 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove unused variable pAdapter
Message-ID: <YVh3MP/JrUwkKr3Y@user>
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
 drivers/staging/r8188eu/core/rtw_efuse.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 801887f497cf..d33a5b3b4088 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -28,8 +28,7 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */

-static bool Efuse_Read1ByteFromFakeContent(struct adapter *pAdapter,
-					   u16 Offset,
+static bool Efuse_Read1ByteFromFakeContent(u16 Offset,
 					   u8 *Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
@@ -96,7 +95,7 @@ ReadEFuseByte(
 	u16 retry;

 	if (pseudo) {
-		Efuse_Read1ByteFromFakeContent(Adapter, _offset, pbuf);
+		Efuse_Read1ByteFromFakeContent(_offset, pbuf);
 		return;
 	}

@@ -134,7 +133,7 @@ u8 efuse_OneByteRead(struct adapter *pAdapter, u16 addr, u8 *data, bool pseudo)
 	u8 result;

 	if (pseudo) {
-		result = Efuse_Read1ByteFromFakeContent(pAdapter, addr, data);
+		result = Efuse_Read1ByteFromFakeContent(addr, data);
 		return result;
 	}
 	/*  -----------------e-fuse reg ctrl --------------------------------- */
--
2.32.0

