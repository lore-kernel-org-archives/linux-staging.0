Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD8807
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 12:01:51 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id t11-20020a17090ad50b00b001d95bf21996so10638024pju.2
        for <linux-staging@lists.linux.dev>; Fri, 06 May 2022 05:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i9PJvhEX8P9EwLto+E+6JAbwn0v8MnYujSttxKDDDe0=;
        b=lksT/n19/JYsn93CnYdttA/s6P7bMZJpP+Ms209BI2CObc+AMkQUlT6IubqMu1Mahp
         O8nRm01qDnsw8e1hE+kYJW6jLabXrejT8hGuB9BWDMm+x1QX9rmAulxyWM3O047U6X4t
         mjDRY4NnhMooqkdMRULWbQnVaHGlvSF+wooVC1frMAzJ9ou4UQ4uEKtdG36GKAptCFEx
         KLcwmJcoNIN4rbNWlMJLTbSB+zINy9WGFSEpYjnAk2dODhQCljiii+pFFgAMINIIrbam
         Bhly8p9NLnSHX1pA8yHLAppMyHH49XGBRqxTfYZr58rLfLH7/gyW3BRRH6N2/ok4VFAw
         XPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i9PJvhEX8P9EwLto+E+6JAbwn0v8MnYujSttxKDDDe0=;
        b=IVhgVxPxNe52krl3Q5m8c9LJj2UVY8TYlHrUvHOI8vwJHUOCt6fnWtqVj3NxSS6RlR
         guFCqYz1Gk7ue5R1HEgnAmSzRu9Cds5pYbUoW1OiR5hSE7k/AscZnHCFECY7pWiwAwvl
         Mze52nsPKy48OHV2gGkQ3lXdPDEacJ2Cb8Wx/AqwetLSgrAH2kaGD7ffRNNH+XW7Khm1
         iDKedu8PcTosk2U1e8dT6NYlTTtjC1dxsOt/rAARewj+uqLH5K7HgGFW29QDvqqBUAJb
         KrOKtl1t0NcAstNfzIi7Ad78ktwNqVUUuSiLYz1Bmhj4axt+z1Aunx1v67HpWh1oSUhB
         PfAA==
X-Gm-Message-State: AOAM530tRk6vnm+l4ucORDIU5cQp65Ct1sDjfCV6raYaSmojpCGMrlVW
	/0eqSP4aVuMm1lLYKyZyrI0=
X-Google-Smtp-Source: ABdhPJwdf1n78F/MCPW8uBDH56G1BwkHvo3AmYJjlhLXlgtLLi3HlnNHA2E1gJPWALUl/vmWJMJpSg==
X-Received: by 2002:a17:902:e808:b0:15e:b27b:9302 with SMTP id u8-20020a170902e80800b0015eb27b9302mr3326522plg.54.1651838511019;
        Fri, 06 May 2022 05:01:51 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id q27-20020a056a0002bb00b0050dc76281ebsm3169785pfs.197.2022.05.06.05.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 05:01:50 -0700 (PDT)
Date: Fri, 6 May 2022 20:01:44 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: dan.carpenter@oracle.com, paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] staging: rtl8712: add error handler in
 r8712_usbctrl_vendorreq()
Message-ID: <e33ea53d36c422fbe7eabec5bd9eecb0ebce1bc5.1651833575.git.wanngchenng@gmail.com>
References: <cover.1651833575.git.wanngchenng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1651833575.git.wanngchenng@gmail.com>

When 'status' returned from usb_control_msg() is not equal to 'len',
that usb_control_msg() is on partial failure, r8712_usbctrl_vendorreq()
will treat partial reads as success.

Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
---
 drivers/staging/rtl8712/usb_ops_linux.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
index f984a5ab2c6f..b2181e1e2d38 100644
--- a/drivers/staging/rtl8712/usb_ops_linux.c
+++ b/drivers/staging/rtl8712/usb_ops_linux.c
@@ -495,14 +495,21 @@ int r8712_usbctrl_vendorreq(struct intf_priv *pintfpriv, u8 request, u16 value,
 	}
 	status = usb_control_msg(udev, pipe, request, reqtype, value, index,
 				 pIo_buf, len, 500);
-	if (status > 0) {  /* Success this control transfer. */
-		if (requesttype == 0x01) {
-			/* For Control read transfer, we have to copy the read
-			 * data from pIo_buf to pdata.
-			 */
-			memcpy(pdata, pIo_buf,  status);
-		}
+	if (status < 0)
+		goto free;
+	if (status != len) {
+		status = -EREMOTEIO;
+		goto free;
+	}
+	/* Success this control transfer. */
+	if (requesttype == 0x01) {
+		/* For Control read transfer, we have to copy the read
+		 * data from pIo_buf to pdata.
+		 */
+		memcpy(pdata, pIo_buf, status);
 	}
+
+free:
 	kfree(palloc_buf);
 	return status;
 }
-- 
2.33.1

