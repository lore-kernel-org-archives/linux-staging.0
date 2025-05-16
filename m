Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E642AA3
	for <linux-staging@lists.linux.dev>; Fri, 16 May 2025 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409149; cv=none; b=CU33nvU03Y9XjNjLB4Gy/yfJEjVAJ18hZxYyCMJYmX70bH6m8i97lFCIcSHUKLDm/BsHa1Xiu01uvjyE7xOft0J3U5J/rV2aUZ0kxgec38BCeMQ/Uo2xpB9y8+c1G7xyVQeoB+afbHRTjRMvjm+JVbEG1FWGLu6AxsHjDCDxW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409149; c=relaxed/simple;
	bh=T4BIEAhDTqZRM5mH//Q104xKr6Ry1/Eg1Nn09EvX+g0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbXXrLhIsc9Ur+N+5ySjj+aK4LnPZZrzabiMKQ4HYa/AAEdcyBFv1oHHLMitWy+3XShtqk83iJvhRN/oJvU0itPFd12Cpsha7Ug3JjMa+c4J0TK+WfwNGTG+0WmyCJPeFSzXGCgxNP4xhsdLzHfqqKIOfHVqLtXgKlLfCQL5bus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXnXp24r; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXnXp24r"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso444007566b.0
        for <linux-staging@lists.linux.dev>; Fri, 16 May 2025 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747409146; x=1748013946; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5LnrWpUjzC81baVRdodmHMAvpPilsMBmZXNYI9sj7k=;
        b=XXnXp24rIyZWza6oNilTo0lfVT11I37EfbIsDnMtEMm5cAx3/Cr4bwPkX/F4OdFyjB
         WPXVYca5ZQjWDWAjwYLUr296qTzg3lnE8ZRdtu4kUo16N9Q0uJLxoswZ6ldv5hFO4nzc
         YGxewApyTz/oqcUAczEVbaG0kNqHrI2YgFFsZ0tDczUEaUEnzgsy03QvRalmKZ8TxVYt
         Jd6PrMzPnxMJnkYgF/7Qoj0aLJkOiT8nBrUFBSdaqZnTfCXqChzVoWfjMhwBaLbI+geH
         8gdejUbSRMEwwY+Rg9CjkWAAwPyQ8NTZPBwr30OxfbiGqKEKm6aVQF0rA8S0c3lhOIvt
         b0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409146; x=1748013946;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5LnrWpUjzC81baVRdodmHMAvpPilsMBmZXNYI9sj7k=;
        b=BoxCyBCNPIC6PSXZ0X3bjy0GTfVZCzMvJywx+FRWN7wmH1D2ctwpf6KPMxS6xndpRK
         eLcBymi/A4rin5HhdhBu+Zr7FOLzgWzqgd9F6QUkm9HCmaeVeIp+QKHGbbJcF6l/zIIa
         jtdAoi/ZYO8gOm/wbFVQhG7IOrbYPbIY8MN8rviny1je3fiVv8ERcZAtvg97QNJ3ozAY
         7lun5NxuG0FaKs7Ra5LFyfkzVan3F09tgCtzsEgMa1Yx/KTnZAPnRHTg6mlGrM45riaz
         2/J5uAqPSkx6q3kJjrCN//Hsl0s0wLA48UrLQ4WyOeWycx5XUJX1D4hS4UW4NjHHXqYn
         PqjA==
X-Forwarded-Encrypted: i=1; AJvYcCXtQfYFlJ71at2rcOLQCkU9ahMziJqmdvWYnmweSRdVx9uCt27yrDljkxNjPT+RuAAI7KLvMzlJplYFwicR@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo3gmbwtqSui5pKi4pGJKPyOE40+zABaWTzksuiYhZ7haoLHUa
	x7aFCL2bRnCoO54x7WDwfEUFuuOIqFI4iamyCxbP/LCgY30GSjpPa/7k
X-Gm-Gg: ASbGncsZu0rX87ZzAHCkTRmwD3MIclk3Z4ZhNUeBfTB7Pyd/CQe1RLBxGRwgc4eDdas
	op2EEy5ki9rk7hpOrdYfm7dsNOMPCb8jeo63z5fu8/F+ua5NrjTC+skYBvVTdCO66pRlJIZ4Vt1
	REYyOax1853vmnM+w/m7YtWUNEEASpSqME1+VWOQ1Adt6/FFL31txVKa7npJUN7neL/FUVtZOsX
	5EJ/ZOtfSbgn+uQ0rut/3DGDgHTpmmqlfLRd0N3Qxzgqmj0nL/uEy+nifoE/TLLOR7bCmyyJAmG
	77gsMAQvUqzanXJSLuHKqw40QPqBpd1Nfti5pwp1+OxZebf9LGsH1i0YRUx310f0n026ytSVFpG
	znW+/iM3er5s+KyAfdTW9fXdoWi7w2pQp+ClR
X-Google-Smtp-Source: AGHT+IGCd4kvqEQL28zuvNOdejv/esSCapeHgE1kimyPHzr1Kjusxal7Vrwxo7ZEzhkXe4YSHMvxTw==
X-Received: by 2002:a17:906:f5a4:b0:ad2:450b:f8da with SMTP id a640c23a62f3a-ad52d4ca492mr373367866b.19.1747409145958;
        Fri, 16 May 2025 08:25:45 -0700 (PDT)
Received: from andreas-VirtualBox (089144209151.atnat0018.highway.a1.net. [89.144.209.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b096sm173795066b.33.2025.05.16.08.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:25:45 -0700 (PDT)
Date: Fri, 16 May 2025 17:25:44 +0200
From: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: switch to kmalloc(sizeof(*status))
Message-ID: <aCdY-OgvoTUjcIeF@andreas-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch warning:

Prefer kmalloc(sizeof(*status)...) over
kmalloc(sizeof(struct gpib_status_byte)...)

Signed-off-by: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index d87025aadccc..0678829ad14f 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -198,7 +198,7 @@ int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
 			return retval;
 	}
 
-	status = kmalloc(sizeof(struct gpib_status_byte), GFP_KERNEL);
+	status = kmalloc(sizeof(*status), GFP_KERNEL);
 	if (!status)
 		return -ENOMEM;
 
-- 
2.43.0

