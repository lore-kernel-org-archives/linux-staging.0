Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37696173
	for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 10:03:23 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so8935265wmb.1
        for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 02:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FUxS/zeQsunxpJsOG0LYDIpNY7kfAUucM99foiqvVzk=;
        b=pX6TlZyD4a0hM/4aZBS0SQwg7NlgCRnD3s2HG/j32U8bZ6q+M4Ioo4E+1/FNalidRP
         PsCbFsGxtsrxQ3aFPwFgDOBV5KNtekm/7LPugJ33LOtAJYVeGMiW/uItmr0HJdKUOkBv
         A3ibgUZwHFcdMBDjNnJlMwea47FmvrmT5gG/KtF2HxaINld4e0xjz68zDIDuVFwiNh6A
         5aBQ78va1DJF0hDvvRTVaEHS6HDJWzTYbXajQ6nM9bNcTosB9HY18N853CLxAhHC7csz
         S3C1zev2OQkEQkB5zq89HWy0COuj1A5xBDb60365+PWEKC2yWT2n6ZT10d8J+xM5pfub
         sLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FUxS/zeQsunxpJsOG0LYDIpNY7kfAUucM99foiqvVzk=;
        b=ty1EdxiB++tznZaI5VeJvg6j9zffIPwD9uzpsc40PH3T2tmtBVPy3k+c3SRe/Wups0
         B00gC5IAHpssp75nRhzf3Q4sXuxWwflUqWEzpU3v4iu20iW7S97n9tO2uDOU4ZBB5v6Y
         iwOJMtZ5uneaqVA6bncqRxLwpKJA5NQWiMq9ohS70b8FLmLV3mqeLkrVIy0gyKJq0Fp0
         l3fJbG+3qrs5EjSJND1/3Ld81KanLJs9Ff8ENFPF3oOk94dFctsuA/3PmjRBXf0fRr4o
         /mtslyWqGhZ3CdN2pqPocdCHl48bNiQWrQiSiNCQAK2hyIftLZHxJKGBzdEyY4aUNvxb
         OvoQ==
X-Gm-Message-State: AOAM530a0AkeCoKF+btQABJcML5WlZxtnwktMGSYPTFVzcFaYf4OMVvI
	FmZ9RLeOT+GUGc6nAig0shaYu7TW9yoY4Eh23RZ97A==
X-Google-Smtp-Source: ABdhPJw39nwCec1xtUFC9eSn7jMDLduA8S5SSIMCmeGctD69Vg18ouqMxMhFecNt0QrchUuwt5qopQ==
X-Received: by 2002:adf:e291:: with SMTP id v17mr3167264wri.479.1642759401615;
        Fri, 21 Jan 2022 02:03:21 -0800 (PST)
Received: from localhost.localdomain ([141.72.243.13])
        by smtp.gmail.com with ESMTPSA id n16sm4484235wms.13.2022.01.21.02.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 02:03:21 -0800 (PST)
From: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
To: mosescb.dev@gmail.com
Cc: gregkh@linuxfoundation.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH] drivers: staging: media: omap4iss: Use BIT macro instead of left shifting
Date: Fri, 21 Jan 2022 11:02:58 +0100
Message-Id: <20220121100258.336877-1-mosescb.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121093722.320082-1-mosescb.dev@gmail.com>
References: <20220121093722.320082-1-mosescb.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
Use BIT(0) as suggested by Dan

Best,
Moses


