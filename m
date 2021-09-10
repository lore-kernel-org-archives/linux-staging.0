Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5BF2FB3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 11:11:40 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m9so2091547wrb.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 04:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qbseSWFL5SJsHF/L9qG3Ou9sIXvfgEprnI2+Eq5KFww=;
        b=qtMjiQS/BHfF2a83tjKl59vutDXgbbprFhZr4MrE63v3hmotUMw2vnWnNIJeNFx0ks
         eWD3G2R9nWG8lBU5i+4ct5aCkNgwARgLz7iDtSaHvWe7ryRh93PeOEgfrfCUHD/esyzj
         n/p/FyurTmRTF8Tvzj1iAz1MfL2QWATpp50ESHv59YJGbJ5/a4piwvYKnCi+JgR1gQsg
         dm93y5aULkrdiTPX2nhDW2zI6GdvDQ67vH452SbFabBUWCHnBfemRm/Q2bbG+KYK6oZ0
         03hqwsylB3kxkP3VxbdKICXg1sX1b5nlrKr8RPXTnXiS+P0gN1+qxIIvBH2AiybCfDLt
         PYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qbseSWFL5SJsHF/L9qG3Ou9sIXvfgEprnI2+Eq5KFww=;
        b=z1Qsw13gGzgUqEPeX2RTefjv82+tJunLdT8vn9qElzK3x2Eccyp145ho+XeeEkFpB7
         9Y2ETBEo5QHegon2/o5GiE9BqkXwqsZw3/4i8WhSwsXgCM+Mt7zBWEyAnSDR3WIztAg2
         KwJb0pMnz9LzsY9jb2/flEV6UdYIAByPPvtfn5eck/W/iYCy4Xz03JKgdNIZlwq4Krkl
         r5A2r1DjMEmkEviUmagyeEFwPbmrJTEbTmwz5ikY/Bx+KhfpjlZ2sPsL/CnedoylbFo2
         jYKXIMkClYYM7FrDiauYLk3Ri83A6zcA1C+Yzq8/IOagSUfyDK+M0pQSUGLvNjYRQ3gE
         uO8A==
X-Gm-Message-State: AOAM531HiIf8AnZd9pbE3j6Zp7n9ff1ka2XJq9SIQVjWqvfdMHEyWJ3w
	2GSAux4QQDDQlGOoGLZDDjI=
X-Google-Smtp-Source: ABdhPJxMHc6T2LFSVcmy/m1qT5YXajzfpSGj/YM6DY3CzGMMumSS3ofZFwg6Qbf9Ip6pFv/hx3WyEQ==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr9071827wrq.58.1631272299196;
        Fri, 10 Sep 2021 04:11:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id o7sm3848828wmc.46.2021.09.10.04.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 04:11:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/3] staging: r8188eu: remove rtw_IOL_append_LLT_cmd()
Date: Fri, 10 Sep 2021 13:11:10 +0200
Message-Id: <20210910111110.4628-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910111110.4628-1-straube.linux@gmail.com>
References: <20210910111110.4628-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_IOL_append_LLT_cmd() just returns _SUCCESS and the only
caller does not use the return value. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/r8188eu/core/rtw_iol.c       | 5 -----
 drivers/staging/r8188eu/include/rtw_iol.h    | 1 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 08677552e5d6..ff08861b7acb 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -72,11 +72,6 @@ bool rtw_IOL_applied(struct adapter  *adapter)
 	return false;
 }
 
-int rtw_IOL_append_LLT_cmd(struct xmit_frame *xmit_frame, u8 page_boundary)
-{
-	return _SUCCESS;
-}
-
 int _rtw_IOL_append_WB_cmd(struct xmit_frame *xmit_frame, u16 addr, u8 value, u8 mask)
 {
 	struct ioreg_cfg cmd = {8, IOREG_CMD_WB_REG, 0x0, 0x0, 0x0};
diff --git a/drivers/staging/r8188eu/include/rtw_iol.h b/drivers/staging/r8188eu/include/rtw_iol.h
index a07c3ae0bed7..bb2c9fcf8985 100644
--- a/drivers/staging/r8188eu/include/rtw_iol.h
+++ b/drivers/staging/r8188eu/include/rtw_iol.h
@@ -33,7 +33,6 @@ enum ioreg_cmd {
 struct xmit_frame *rtw_IOL_accquire_xmit_frame(struct adapter *adapter);
 int rtw_IOL_append_cmds(struct xmit_frame *xmit_frame, u8 *IOL_cmds,
 			u32 cmd_len);
-int rtw_IOL_append_LLT_cmd(struct xmit_frame *xmit_frame, u8 page_boundary);
 bool rtw_IOL_applied(struct adapter  *adapter);
 int rtw_IOL_append_DELAY_US_cmd(struct xmit_frame *xmit_frame, u16 us);
 int rtw_IOL_append_DELAY_MS_cmd(struct xmit_frame *xmit_frame, u16 ms);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index b428d0b36171..e3e43c8cd11c 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4021,7 +4021,6 @@ static int rtw_dbg_port(struct net_device *dev,
 		switch (minor_cmd) {
 		case 0x04: /* LLT table initialization test */
 		{
-			u8 page_boundary = 0xf9;
 			struct xmit_frame	*xmit_frame;
 
 			xmit_frame = rtw_IOL_accquire_xmit_frame(padapter);
@@ -4030,8 +4029,6 @@ static int rtw_dbg_port(struct net_device *dev,
 				break;
 			}
 
-			rtw_IOL_append_LLT_cmd(xmit_frame, page_boundary);
-
 			if (rtl8188e_IOL_exec_cmds_sync(padapter, xmit_frame, 500, 0) != _SUCCESS)
 				ret = -EPERM;
 		}
-- 
2.33.0

