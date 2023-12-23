Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E438BE5
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5OV320y"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3e05abcaeso16037975ad.1
        for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 00:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703319244; x=1703924044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWY/DrbKpHrD7fzJ1z2jZBqElDolNrxGwdlBP2/yWF8=;
        b=X5OV320y0h0mYW4sSKFoIh87HXD9hW+pRz2Gqxmnt67g3ynyBcoNVAIXUKOCnwCa1E
         Hl89uWphi37IKbePEWCmIcx8hjNP4C/aVsX7M5oGZMwSXRsWfThgmcVq7SxtXMgQREjz
         /e6bv4grTMXfp8OQDzcT90V1dC8WS1/VZI4rjFzGm0Ns55JJHgnhyKGFROVs/Gr4+Z3M
         iDUFQ+jaHU0n6cjLqkx6pFhML3pzdTOF4ja1T8G8Oaa5mEQ8WihgHS0ZrlkO/xzcH2rk
         L2dwt9oRgKpVidIjRm1iIfxQnC/w1EwvNESHsuKLBbeltGLI+vfesfI9SU273lwZQCa+
         /8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703319244; x=1703924044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWY/DrbKpHrD7fzJ1z2jZBqElDolNrxGwdlBP2/yWF8=;
        b=rMEnqmImMqOLruNpdpdI8uMBjGAVDrhD8EGcEGIq1zgSq2MAYESonEh2SLqpspsYXO
         Q2t2/hAO770TOMKtihsZVQZHmSmaNfnQcHhtRGDjxNAmRNRvYJqe4cVxSKXcLAB0sSeL
         dAl7bG69w9BBie+7dZje3wqFbAaKtAZqUwy/mwtWyXjuTrYshtIWHrK6TTV6xRELH5Wo
         Rrs15RnsUdtGFER33O83H8xFHf3nPXfdCoGP95kKomEStMgdiL4eZuuOD1j/aULNmbyi
         MZfwwm7OgcX8GegU1WC4kk8mzYI2LnZMb22T4VfzN5VGOUN4PKD/WwdGSi+k9QuGmkZw
         dP7g==
X-Gm-Message-State: AOJu0YyxXEHQ0ve07rOpjC39u/p+id9B7HG9nN2/fR8eDKiRyWO89uhu
	2Fr8iPIcoDWJe4EQRlI1qpY=
X-Google-Smtp-Source: AGHT+IEbzbGvxC0VlmUd4kvcsYMPpJni2HxqelHej4BgKav2uvZ4yLinClyCCZgffXUfCLVIYLFwuQ==
X-Received: by 2002:a17:90b:f0c:b0:28c:2b2c:1bf4 with SMTP id br12-20020a17090b0f0c00b0028c2b2c1bf4mr115808pjb.15.1703319243544;
        Sat, 23 Dec 2023 00:14:03 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id pb11-20020a17090b3c0b00b0028c2e36c449sm750776pjb.51.2023.12.23.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 00:14:03 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/isp/kernels/macc/macc_1.0: Fix spelling mistakes in ia_css_macc_table.host.c
Date: Sat, 23 Dec 2023 13:58:54 +0545
Message-Id: <20231223081354.83318-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in ia_css_macc_table.host.c below:

'''
./isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c:22: matix ==> matrix
./isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c:39: matix ==> matrix
'''
This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
index 946b074e8288..d25bf59273ba 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
@@ -19,7 +19,7 @@
 
 /* Multi-Axes Color Correction table for ISP1.
  *	64values = 2x2matrix for 16area, [s2.13]
- *	ineffective: 16 of "identity 2x2 matix" {8192,0,0,8192}
+ *	ineffective: 16 of "identity 2x2 matrix" {8192,0,0,8192}
  */
 const struct ia_css_macc_table default_macc_table = {
 	{
@@ -36,7 +36,7 @@ const struct ia_css_macc_table default_macc_table = {
 
 /* Multi-Axes Color Correction table for ISP2.
  *	64values = 2x2matrix for 16area, [s1.12]
- *	ineffective: 16 of "identity 2x2 matix" {4096,0,0,4096}
+ *	ineffective: 16 of "identity 2x2 matrix" {4096,0,0,4096}
  */
 const struct ia_css_macc_table default_macc2_table = {
 	{
-- 
2.39.2 (Apple Git-143)

