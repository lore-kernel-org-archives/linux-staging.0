Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BF98C01;
	Wed, 22 Mar 2023 15:01:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso11714014wmo.0;
        Wed, 22 Mar 2023 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679497315;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DgWPl66ZYekMljnHqI2dpfEQRj570j4dEOn6iVgr8Vk=;
        b=W+Oxrjx5FFH0z4MVlegTDfz7IZ+yko7Mg54TEmXyYH2w3I3HP62l+Q/x5B7AzrEPWE
         sagwKI2jQBZVxtMqyQnjm1Dmyp3IIZV0ioityrRHpw8KfaJT/YV4lzYPId/eatvacWkB
         8vzle0a0K5EbGmukGaMRdHpVGS2Hyhc9lkgZoLvQVHxiCeMxQAOhmBKB/XkvWwfuuHcP
         jzgS34YN6ucvrAj1hpcyzpQuTh1sR2sP0zrBI1NTIOj4g5gf0qfgf0F1qPj9PDzpH2q0
         3RjVwaKvK7svm6LSdU8uitZSO1q0ZKbjEwPT3NSlDKj/QcKtobq/ErTXiKw/RHLFB6ah
         TBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679497315;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DgWPl66ZYekMljnHqI2dpfEQRj570j4dEOn6iVgr8Vk=;
        b=rhLX/4ALRLRNSEPRqKFQQ7YiJ/MKfk6QjTpjhZ3woWQOAs2CdqiUXr+mu9Taxvplmi
         zsfLdJVqLFP3ViEP9G+PHjdU9hdXRXXsx1UwLL1up0knPhHjnDQwLpJ1tiEGpxa1Hk4E
         uWtMn2jUjaIqW30Y8kwG/e/0dyOnzrMgb4EExakbOUxqAp0q1KMwnZbaRHBi+hwMLkvO
         bVuPfs4mU1ylH5aoTwoyLOZHHO4Ayc+84CTHqn0woVnZv9wnpBf/NpcKgCdEY5yhROix
         u3dw7XD0vp67ESoZ8sjhLQ2az/dtxZ2GIUews8zqcQtArYwlb7BvC6YWvL+tGQ04kwys
         n0ZA==
X-Gm-Message-State: AO0yUKXrbRbuC7TEOythGmDVDIH3CYDLz3sHBzpFO4TtIH4lW901uu47
	+oYWkRnwSQ4n2/CoXZlBS1E=
X-Google-Smtp-Source: AK7set9FB+V5HVQj0fRSzaX064ikAu6JSuBgFDxBRfmO9C84Gk5570jz57xM3/gKtdsWJshsdP0yBw==
X-Received: by 2002:a7b:cd0c:0:b0:3ed:8bef:6a04 with SMTP id f12-20020a7bcd0c000000b003ed8bef6a04mr6007546wmj.27.1679497314922;
        Wed, 22 Mar 2023 08:01:54 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id u7-20020a7bc047000000b003ed2276cd0dsm17049264wmc.38.2023.03.22.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 08:01:54 -0700 (PDT)
Date: Wed, 22 Mar 2023 20:01:52 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: most: fix line ending with '('
Message-ID: <ZBsYYAc1Ue/JnUAm@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the function parameters right after the '(' in the function call
line. Align the rest of the parameters to the opening parenthesis.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---

Changes in v2:
 - Changed the description

 drivers/staging/most/dim2/hal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index a5d40b5b138a..6abe3ab2b2cf 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -346,9 +346,8 @@ static void dim2_clear_ctram(void)
 		dim2_clear_ctr(ctr_addr);
 }

-static void dim2_configure_channel(
-	u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address, u16 hw_buffer_size,
-	u16 packet_length)
+static void dim2_configure_channel(u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address,
+				   u16 hw_buffer_size, u16 packet_length)
 {
 	dim2_configure_cdt(ch_addr, dbr_address, hw_buffer_size, packet_length);
 	dim2_configure_cat(MLB_CAT, ch_addr, type, is_tx ? 1 : 0);
--
2.34.1

