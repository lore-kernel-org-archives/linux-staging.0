Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0B2182A7;
	Thu, 19 Oct 2023 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGGrVQkE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-406609df1a6so71488135e9.3;
        Thu, 19 Oct 2023 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697710448; x=1698315248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGUCtaetBy4DTIj7ObfcLLLAyE9bn8S8QtM2xGRSe0M=;
        b=RGGrVQkETvRoVIp4HOxbFHhKhcqQLnt0ZnGxtNYZ4hKtFg4x9ae1sUJZcPOTUD6bIH
         v9hKdAfXjplGZWHQQDiy94Vh3VmJQS3HAhx9JN3FWwq1RkSbBaY6T9OggwiiiF3aOWnk
         svTkyzwIGWz1vPhhUeIx/4DZxtmropAwbzjyUsf5f9LhCo/1qiwqO1UbrEhISwIGpuK/
         Djb5DTToYglg+IyRAh8Qlnp9COA8Yw82/TDRFUJygKgCe1Oikn57XAE1qg3lNfiEjLsU
         XJ9n/6ZvbxS90WfiXtjJ38/eo8KkwHYcQ3HotOU6teNyE+HcoSOPf4bEVDOsD8bgkBPB
         jKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697710448; x=1698315248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGUCtaetBy4DTIj7ObfcLLLAyE9bn8S8QtM2xGRSe0M=;
        b=XC6mCNitNijc4Uuv+psESEAFgo900TlQHQi/RBkp5sF2nUM9wYD6glyvLUW9OT3dqZ
         fLGdlDvhhsts7L/t33RDWDe5TFyIOiLqfn9Sp/X4ZCKOis6VMQfczwXJ1HjD85Vilxzu
         1n/9NOa5ephZ5a6GMRs/0jFptYY4Rknt18cwFxHFr83neHw1Oi+55NZmmejHWqE9VVbZ
         nGjO9eYsjU8XNHBggLRPHNckP8CfSIyz9hnWJEgaYkWKMVHHpMFgYTDOe8X4eD0x96OV
         LDIRl9Fs5DkRpNSUysLAvraBVyheRYSI4l0lYuSzctIRgXL2AT5axl7+8+7fiJTITmUK
         W/dw==
X-Gm-Message-State: AOJu0YwNs/tsKwpylqVNHJBfLq8fOwaZGO7xPA2kVGzqMkrwR9mVMk7e
	1+EQkko7tS6gqvHTkG+1Lg==
X-Google-Smtp-Source: AGHT+IHzEjL2ZofK/ahM41KnEDz2FgNb9Vtr//9lYhRkMtUZitajDwzkRFkzi1Y0FLbZVt3K6x+4uw==
X-Received: by 2002:a05:600c:a07:b0:408:3f64:6553 with SMTP id z7-20020a05600c0a0700b004083f646553mr1397018wmp.16.1697710447394;
        Thu, 19 Oct 2023 03:14:07 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.8])
        by smtp.gmail.com with ESMTPSA id l32-20020a05600c1d2000b00402f713c56esm4109300wms.2.2023.10.19.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:14:07 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: sm750fb: Remove unused return values from functions
Date: Thu, 19 Oct 2023 13:13:35 +0300
Message-ID: <20231019101348.22076-1-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modifies the return type of different static functions to void and
deletes unused return variables as the return value is being ignored 
in all subsequent function calls thus not useful to have a return type.

This improves code readability and maintainability.

Changes in v2:
- Ammend wording in cover letter.
Suggested-by: Julia Lawall <julia.lawall@inria.fr>
- Drop variable 'ret' entirely as it is unused.
Suggested-by: Julia Lawall <julia.lawall@inria.fr>, Greg Kroah-Hartman
<gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org> 

Dorcas AnonoLitunya (2):
  staging: sm750fb: Remove unused return value in
    display_control_adjust_sm750le()
  staging: sm750fb: Remove unused return variable in
    program_mode_registers()

 drivers/staging/sm750fb/ddk750_mode.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

-- 
2.42.0.345.gaab89be2eb

