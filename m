Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837F7C
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 06:30:10 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso38600602pjb.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Apr 2023 23:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680676209;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0bB1kYFHG3GuFXYutZKTFfpB+QkP/nts/ZTV0mtgBE=;
        b=auOVV7VQXJSNoNNBvTbjiavaFkV3WknqhzofEtv2ACoEhbOL2uu30NVuIRhaYgGJKI
         jDrsP4r7IdfLvQ8uJ0R3ItpSxMtxZeNIU1GzRzur1iwpDXYopg1aLHnAF1QeJJvSkSeM
         kexTEI0yr8J9hEQJQJTMat1p2t8gUE5uhpxjeT/PVbFQ+DGqAeBAlOnfErzltzVFL2cy
         XCpBnQXigzs7t3HvnFUiTOYaTmbinNAO+FkXkJlMFWIzPeyoIYfZeoR4KFBMSQT96FBp
         8mY6495899c1m2rPn4Bq6Q/wEFmpnGLR9NCCGjsfuRNOgdEkmmIrsistArj7YCePbohQ
         wXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680676209;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0bB1kYFHG3GuFXYutZKTFfpB+QkP/nts/ZTV0mtgBE=;
        b=sOhaoE2l5GGKsTlxTQszahHAoZfBbdLMQSx6FzlJ+4/bUvi2EAQLp21GTFL7iEgWxs
         7jJ6+g0Lx9m1HoI7gk2rvXRPsFbHpN74kZw+UfXhRsaJLqcfwbiLlvQ8xi2RfO8k2dbO
         JRP8LNGPP4P4/ZjvmXQCB+AWp5GUfqhgn/686HkEjfrnvbY/Q8oGRHjRruImevmglPGV
         NGkTRna72Ip5tWJFKqL9at0kLCzBN8ae/VlOmXSPSAgB2vSQbY/GcN3LV16zHq/pgp7t
         hjSw4YftL3spZjHhgoHVETvpu/3RYl+1O6lEevr7AaSVGQxHjRpd+aDSJks/K2bhw7Vn
         QZpw==
X-Gm-Message-State: AAQBX9cMjDX9Ns5jzOdcuBrnCNUJIHh599wVa+pCfH3nNHbIBcxhtfdR
	MX9LYzNKD3NWMO4BQ747acnivJ8EPfYbNQ==
X-Google-Smtp-Source: AKy350ZynztHKjqCYj14bywgk6tbPxWzAGEesedIFyacNQtfSioA+6xNWQhzJCSPte+y4yJ5xc15SQ==
X-Received: by 2002:a17:903:11c6:b0:1a2:7afc:7cd with SMTP id q6-20020a17090311c600b001a27afc07cdmr6425985plh.22.1680676209470;
        Tue, 04 Apr 2023 23:30:09 -0700 (PDT)
Received: from sumitra.com ([117.199.165.210])
        by smtp.gmail.com with ESMTPSA id jf2-20020a170903268200b001a27e5ee634sm9369061plb.33.2023.04.04.23.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 23:30:08 -0700 (PDT)
Date: Tue, 4 Apr 2023 23:30:03 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Add blank lines after declarations
Message-ID: <20230405063003.GA218972@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add blank lines after declarations to adhere to the Linux kernel
coding-style. Check reported by checkpatch.pl

"CHECK: Please use a blank line after function/struct/union/enum
declarations"

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 197c0a44ebd6..9f8f97776dd3 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -971,6 +971,7 @@ static inline const char *eap_get_type(int type)
 	return ((u32)type >= ARRAY_SIZE(eap_types)) ? "Unknown" :
 		 eap_types[type];
 }
+
 static inline u8 Frame_QoSTID(u8 *buf)
 {
 	struct rtllib_hdr_3addr *hdr;
@@ -1203,6 +1204,7 @@ struct rx_reorder_entry {
 	u16			SeqNum;
 	struct rtllib_rxb *prxb;
 };
+
 enum fsync_state {
 	Default_Fsync,
 	HW_Fsync,
@@ -1329,6 +1331,7 @@ struct sw_cam_table {
 	u8				key_index;
 
 };
+
 #define   TOTAL_CAM_ENTRY				32
 struct rate_adaptive {
 	u8				rate_adaptive_disabled;
-- 
2.25.1

