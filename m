Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702742CA6
	for <linux-staging@lists.linux.dev>; Mon,  6 Dec 2021 00:19:53 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id s137so8838299pgs.5
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 16:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=npw7Iyxq7UD84uzsZEwuks/5/kqnSFKjH/ECcHsrdZ8=;
        b=L+s3HRBbl5GITywCslsXWINBV6KwCmLDEWLFowcoXw7YDtbxCyAFdZS+mnTtiShdjn
         F4DPetkLgxLFyRdjZtFZN+C17fQpYDfpbJKjjJcaETL04lRVzIhnZi7fJaxdLD4mUdvn
         wUl/MQT0iG5kSSbxwAnxmnbwuMxynGCg1JNj4x1vGDVo33uu1xRftmV0OHVPiQozN6bh
         6PhbK0DCjQKFFlOZ+I9Loc/XyPT4qR3NcR7bawfGQruFzuhEwzNGg/SE5KkRYxTfpfLG
         dVeUfM7PldmUAZfuc2CzuuTaK8X8ZmBxfpbLRcq5uXfbY43OmB2ug9hy+WYTR/IP6/am
         xb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=npw7Iyxq7UD84uzsZEwuks/5/kqnSFKjH/ECcHsrdZ8=;
        b=D25E8F2gditJCDEwwBfZCZzevlZ7tT+sjqqT1B5HVe2ic+zNfvGMP77iAKUxQSSsQf
         U1qovPDSF6sJHv/fLWbruD4AAgU05OZhbpoC3N0f1u0YfGW7C9RCpDCvcbNRkshDUUrF
         cY1puNFPbTft+F3QnqcbBpwjQmrXuTqomct97/2PB0lwpgKkwSzMXxgBkk7pPcJinwuP
         qcXMpa7oG67NrAyJXjbkeYBsxWmbgvJAeTif3WfQH3LxYKBbEWPpcSU5gx2E1S/w1pIo
         hGrOSvjNeFy/oBGmpBYdPG6oPSDZVyxL7pJlUo9EMFlB7CPcWeZMKOB1VArtncE+9PMb
         OCHg==
X-Gm-Message-State: AOAM530sUXUhGwgjXJ1Wp0Bt+wU4eRWhSrXpGlUXEp1QIvpKcnLlzQHc
	RkDWwsciVFZ4VjaLGPXZ6B8=
X-Google-Smtp-Source: ABdhPJyyUa4Bp2L6x4ocg2xm2Cz0zvFsl3W3opLW77ig1VXdMHwlA6LVOWCWq8s6eWXJ0QcGBQpDxg==
X-Received: by 2002:a63:1ca:: with SMTP id 193mr16152398pgb.88.1638749993042;
        Sun, 05 Dec 2021 16:19:53 -0800 (PST)
Received: from simon-desktop (n112119139022.netvigator.com. [112.119.139.22])
        by smtp.gmail.com with ESMTPSA id k16sm11053134pfu.183.2021.12.05.16.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 16:19:52 -0800 (PST)
Date: Mon, 6 Dec 2021 08:19:49 +0800
From: Ngo Tak Fong <simon.fodin@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Fix alignment checks
Message-ID: <20211206001949.GA54773@simon-desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed two CHECKs of Alignment should match open parenthesis.

Signed-off-by: Ngo Tak Fong <simon.fodin@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_efuse.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.c b/drivers/staging/rtl8712/rtl8712_efuse.c
index 4f3b54a7c3be..3555f612a066 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.c
+++ b/drivers/staging/rtl8712/rtl8712_efuse.c
@@ -300,16 +300,15 @@ static u8 fix_header(struct _adapter *adapter, u8 header, u16 header_addr)
 		for (i = 0; i < PGPKG_MAX_WORDS; i++) {
 			if (BIT(i) & word_en) {
 				if (BIT(i) & pkt.word_en) {
-					if (efuse_one_byte_read(
-							adapter, addr,
-							&value))
+					if (efuse_one_byte_read(adapter,
+								addr,
+								&value))
 						pkt.data[i * 2] = value;
 					else
 						return false;
-					if (efuse_one_byte_read(
-							adapter,
-							addr + 1,
-							&value))
+					if (efuse_one_byte_read(adapter,
+								addr + 1,
+								&value))
 						pkt.data[i * 2 + 1] =
 							value;
 					else
-- 
2.32.0

