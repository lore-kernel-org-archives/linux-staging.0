Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7D2F23;
	Wed, 13 Apr 2022 20:40:17 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id w7so2988501pfu.11;
        Wed, 13 Apr 2022 13:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ofzGk5ytG3lYUW93rmfcZLd9Bf4p7SSPpSO9tlTspg8=;
        b=Eud21792IoQcEQWMPPwHo7zSKQqwGSLROhNSufibN233z9QUrPLBbdTvwSwHOc3lxe
         ZDmH1wU+Kx4XTgSoeFVg+lCkngTuZmx4Q2sQTVVK6lWcZMkKnva0hUk8jvC4XWwWjMzA
         ZQCoZH7ZMlqJSZ04xwtoJS+vSGRumO/sxka8wCj8KBGGw9V6fyrSsrhObIcFZSF8M0M4
         8liOfKsmjA0vOS8VTcSltiFqRWxF7WezoT/jg931VPEPWoXxMxwAS8e9NK5Gtswf+VMh
         fxm+KHGwy8eB/pAlPhVfpFm57vqKIiTr4/uAG1b/yBuN0hyzsXGaSgRLVHS5QZEu3HFO
         FdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ofzGk5ytG3lYUW93rmfcZLd9Bf4p7SSPpSO9tlTspg8=;
        b=CoGjF6cOYEPplgR6j8ZqSZiz1NMPGRJQqqxnRYJTV0CjMQMEaeIlGAJvnu/OGFCINH
         d7lfxycs9Rr39MXZ/9+kWuvb2u7ODxydWbOhax87CUEogeDcLel00ihJyTIqCAn8mxY6
         Y4VeM6iQ2PTKA/o881+hzukfsNUHcdK29foR4OUW+3IiakeQPCiAjKuSKnvXht6BqRF+
         zGfzylpQuYgAhOS8fwzZQF8/1AI3KQ8HxcAJyu0wkI3u/TVBsZPtL6WZ6TRWWWDeLmnl
         98WwrNrIanXtpYYY0ZF4pOcKKx8vqHdGjPV6wpyh5SpKZdOXjcgUJNDW9l4Xb0DDLGa4
         L/XQ==
X-Gm-Message-State: AOAM531BL0w/u/+D55qJFhfUvF9TsVrNNdcsMix0DsEQjg4sDyCvQA7X
	0ahEVPYDcTTbXiKqLLVnp5g=
X-Google-Smtp-Source: ABdhPJxQPKxszN7r8f/WJ8l58NLLTGIARGqd7xrDBil970t2NDCKHhCewJxsqZLT3MI9JecP3P5rDQ==
X-Received: by 2002:a63:510d:0:b0:39d:3f7d:2b0d with SMTP id f13-20020a63510d000000b0039d3f7d2b0dmr15992746pgb.448.1649882416582;
        Wed, 13 Apr 2022 13:40:16 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id a67-20020a621a46000000b005060c73ef43sm3969101pfa.195.2022.04.13.13.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:40:16 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH] staging: sm750fb: Remove volatile
Date: Thu, 14 Apr 2022 02:09:15 +0530
Message-Id: <20220413203914.59533-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove volatile to fix checkpatch.pl warning.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/sm750fb/sm750.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index aff69661c8e6..7a11f8593596 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -52,7 +52,7 @@ struct lynx_accel {
 	/* base virtual address of DPR registers */
 	volatile unsigned char __iomem *dprBase;
 	/* base virtual address of de data port */
-	volatile unsigned char __iomem *dpPortBase;
+	unsigned char __iomem *dpPortBase;
 
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
-- 
2.25.1

