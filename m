Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE82FAE
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 11:34:39 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id lz27so41246565ejb.11
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZcnauAoKMjGNlUsDzSkeilOQyTIMkcoWQzdmXNNNOas=;
        b=fClq0uslXrKhWPECjmlTFEfOFcjxmXpfvfMJ7AeFDtwQLs4YYIS5aXVEf3ZcANENrR
         lDFx1hYzoyffYfiFxRGKK+5lruYqG2KwNWt1jTHmvgIpULSHMpEHcqTjVjw9GpOdxU/r
         s07UTqM898TfTbSXuTdCPBDlqDCeJ00dIpvlrtPkLhWKeQXm81i1xfFR71weALntROLV
         F6RbvYhbdfHm0TAxBINvkFnA2RI1FuyrJx8DZj5zyH+pHQGMjOs0TLxlYE4boWMpQzvP
         PzwhvB1KPhojpFK3HCCXStexHvLk4BQr0fLsr1UqIa9tP1z01sloaQwgkB5aHNGFo809
         GKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZcnauAoKMjGNlUsDzSkeilOQyTIMkcoWQzdmXNNNOas=;
        b=sV84VsAPq348QR/WC2xlxNmTgBWJl/Sy+LKKgWtsHk29pmVcsp9pkAoP2Wi2KV8I+H
         f9hj/OvCf68qg0oWfMszqY0EgcLgsoZkJVmy9ngHwkllYtQq8jGOPchv3u8wpXnUAZI2
         AQKSu4XRosVq6iVckM98BTycR6/EwH8kfTf6UpDvKdGjziq1JP4Mea3HkteGVbcCtEfw
         Bl3aSmJRB7ImHRf/pClC+mV4Kj83bPprUj7spm0SJrqdY/zjvOcoXBtQDayuQ8rU8KCV
         kXOvK4q3rs8m7ohr6vjc/79DaMD9EEI/FQlL/eQLN2Fnm8T4C3YJpCyFRq8rjBQae/Sh
         RIQg==
X-Gm-Message-State: AOAM533ieBnFiXXHvH38Vz0aoY7C4LXAdMXq0yFZlkf4s2T1OCl9LJLu
	Dq+QPJVEI5wU65sloEQaqmwHciYsc39g7A==
X-Google-Smtp-Source: ABdhPJzQt40/Kt6EHNtqFXhn8tnwr8JwIomvdyM4kG6h+lcUrqOwWL7HIk4N3wI5+02/D/Y8FhpgaA==
X-Received: by 2002:a17:906:594f:: with SMTP id g15mr22585028ejr.103.1621856078024;
        Mon, 24 May 2021 04:34:38 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id x16sm7675905eju.30.2021.05.24.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 04:34:37 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: core: rtw_mlme_ext.c: Remove set but unused variable
Date: Mon, 24 May 2021 13:34:33 +0200
Message-Id: <20210524113433.25923-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused 'reason_code' variable. Issue detected by GCC
running with the warning option -Wunused-but-set-variable.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1->v2: As suggested by Dan Carpenter, removed call to
get_unaligned_le16() and modified the commit message accordingly.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9fc612fb736f..97b3c2965770 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1721,7 +1721,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char 	*frame_body;
 	unsigned char 	category, action;
-	unsigned short	tid, status, reason_code = 0;
+	unsigned short	tid, status;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -1790,9 +1790,6 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 					~BIT((frame_body[3] >> 4) & 0xf);
 				psta->htpriv.candidate_tid_bitmap &=
 					~BIT((frame_body[3] >> 4) & 0xf);
-
-				/* reason_code = frame_body[4] | (frame_body[5] << 8); */
-				reason_code = get_unaligned_le16(&frame_body[4]);
 			} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
 				tid = (frame_body[3] >> 4) & 0x0F;
 
-- 
2.31.1

