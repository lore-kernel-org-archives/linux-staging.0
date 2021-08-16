Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFA26D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id f5so24292299wrm.13
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWZteSSOPkMjXyO6ylx1CA4k4vpQ3VxPRaNeIUGg9fg=;
        b=PqNQUUrO5YBZQCL8GNYJgWfoq/7OWJSdp6lmito9YbxKNUf5E6cnPE++DqRDptBQPp
         NkY86IjgFHsUgGa4ZLBIsgs9X6yLL/f+m1m4Q1AntrS0n/Fu6TQxpzcnrWqks6qDTRg0
         qJkTYtHqnPzIXzxDwWFiC4XkQmDfF3gUSw4mfa8hULcDabNPWv5A9cNBLQPh9BTzaSVw
         NZR8GmJRTCf4b9I3wq3FfSpPDXN8xr9aWQ6IIyKxL5IM2zeWlw+rAm0Pxc5HYoz6qJS9
         X1Ivv978OjyQaPjh080O6vgCPkYJ3Yz81K9i8AzLWJOP1nKF0Q2vgCF4wr+txZy/6iMW
         IUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWZteSSOPkMjXyO6ylx1CA4k4vpQ3VxPRaNeIUGg9fg=;
        b=H0BP6Khgpqg7rCjuGp5IgUHzFWWcxM/EFg6lvWZ3mmVmvq1jEfhrD4jwRDzIZuxHOg
         ezJIJAAhkhHReplCWUkzrTcSCx2IRaye4TWc04z19V3MVNuTRSFoeIibFlpqx9pOWvq6
         Qp4FQ7OUzqBCM20bCPy9HvsnVpfxIc72GSoISXRo+d1mw5aIHHWVu8zdfgSU3LAOMPkX
         r24d6jA4f5eAD8Sikbv0ZQyD38t7boGe45pV45mtglTKPKE0sAn5PEZkBDyyIx+TGkbr
         skCXWOM2wTiKmxQPiLqn4QQTdD3mRGqR0W7OqfXE5l605EEt2ji2bdQyen5ipzwEo3/2
         zqCA==
X-Gm-Message-State: AOAM531McnYCstebQzrwA9TYWeEikQvk4ufdBwO7IFh0bo0VexMfPRBL
	WdLb1a8M8zW8OXmPx3cq54yV5BgKcIE=
X-Google-Smtp-Source: ABdhPJxpEl11LhdOIpYig83yrMVWXEyaQxZB8vBEmfHFJDn52WaM3Wsjw0NXboEmeqQkkOApcOg1Pw==
X-Received: by 2002:adf:8287:: with SMTP id 7mr19307773wrc.360.1629129569800;
        Mon, 16 Aug 2021 08:59:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/23] staging: r8188eu: add spaces around operators in core/rtw_iol.c
Date: Mon, 16 Aug 2021 17:58:04 +0200
Message-Id: <20210816155818.24005-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around operators in core/rtw_iol.c reported by
checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_iol.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 927b8c919fa7..5c1b19679cad 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -46,7 +46,7 @@ int rtw_IOL_append_cmds(struct xmit_frame *xmit_frame, u8 *IOL_cmds, u32 cmd_len
 	u32 ori_len;
 
 	buf_offset = TXDESC_OFFSET;
-	ori_len = buf_offset+pattrib->pktlen;
+	ori_len = buf_offset + pattrib->pktlen;
 
 	/* check if the io_buf can accommodate new cmds */
 	if (ori_len + cmd_len + 8 > MAX_XMITBUF_SZ) {
@@ -128,7 +128,7 @@ int _rtw_IOL_append_WRF_cmd(struct xmit_frame *xmit_frame, u8 rf_path, u16 addr,
 {
 	struct ioreg_cfg cmd = {8, IOREG_CMD_W_RF, 0x0, 0x0, 0x0};
 
-	cmd.address = cpu_to_le16((rf_path<<8) | ((addr) & 0xFF));
+	cmd.address = cpu_to_le16((rf_path << 8) | ((addr) & 0xFF));
 	cmd.data = cpu_to_le32(value);
 
 	if (mask != 0x000FFFFF) {
@@ -164,9 +164,9 @@ int rtw_IOL_append_END_cmd(struct xmit_frame *xmit_frame)
 u8 rtw_IOL_cmd_boundary_handle(struct xmit_frame *pxmit_frame)
 {
 	u8 is_cmd_bndy = false;
-	if (((pxmit_frame->attrib.pktlen+32)%256) + 8 >= 256) {
+	if (((pxmit_frame->attrib.pktlen + 32) % 256) + 8 >= 256) {
 		rtw_IOL_append_END_cmd(pxmit_frame);
-		pxmit_frame->attrib.pktlen = ((((pxmit_frame->attrib.pktlen+32)/256)+1)*256);
+		pxmit_frame->attrib.pktlen = ((((pxmit_frame->attrib.pktlen + 32) / 256) + 1) * 256);
 
 		pxmit_frame->attrib.last_txcmdsz = pxmit_frame->attrib.pktlen;
 		is_cmd_bndy = true;
@@ -181,9 +181,9 @@ void rtw_IOL_cmd_buf_dump(struct adapter  *Adapter, int buf_len, u8 *pbuf)
 
 	pr_info("###### %s ######\n", __func__);
 	for (i = 0; i < buf_len; i++) {
-		printk("%02x-", *(pbuf+i));
+		printk("%02x-", *(pbuf + i));
 
-		if (j%32 == 0)
+		if (j % 32 == 0)
 			printk("\n");
 		j++;
 	}
-- 
2.32.0

