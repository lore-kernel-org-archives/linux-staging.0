Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947517F;
	Sat, 25 Mar 2023 07:06:05 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id ew6so16007722edb.7;
        Sat, 25 Mar 2023 00:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679727964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWzZjuKdZZ8Q41Kypgjwm630o9Xz66N9zx57beMyRnE=;
        b=Dz+KHMweeCAV0UaTu2DCL6ZJ4rBQy5Khd0fEvgajww3FNewXVlalFD+0kYl6hxadSQ
         YwkGwSIOl/wWnpBi9vdnyQtPuC4wQlf4eML7eZdraGB468yA8y7lbpZ/O5SAuGXmhpAh
         0HwCpymSkpjVEPNBmtmxlJXAJlvDKnJdz9Nke3n9/64qDB7Rt4JL35YZcWBM3lyvZp51
         BsJhihkf5LgWO3kwb4KwLYYYqLZI5hvQfx32vjd4zoBNLsqajtpkdto8GGdqBNMyjf08
         vLYjzBfxyJNuPFlYNDjZoHyLvW+/WRGQQGLwqEV0DCI/r+l+fdL3a+Euu50JgPvC9nW5
         NboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679727964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWzZjuKdZZ8Q41Kypgjwm630o9Xz66N9zx57beMyRnE=;
        b=dyypH2LeFUzSDmd0RK2dtq4gi6BJ55wQgvjzb+y8cs1GFOgpTbvozGX9c9i2kGh7BD
         RBsihVxGFIygB+5qyL26jjM1PZH6AVKixDHlAwKMiD+6T+STdi1Zf8/8yZUj8X+lxjGB
         VLxZG5T4xmCMQwA1MnHl3jSI/t529Ep8773dHv9puPukaCTA2lElqG5QEsMDe0Zi9GJk
         pWS1OPFyOtTO9Bx2azH/wPMoBN8aOoIIQytquir8tkGwn1OgchvtWEgCZQSW/pxfpuXB
         PcddJy2TNtI1x31xfFvdSQrNFM7Q1ihLyYkRjsJ4GIjvSMikVU8htKTPxySRmlNgBtBL
         VJ9Q==
X-Gm-Message-State: AAQBX9ceP2jh+Cil3P+eN2hUbz7bWRdKmn5jTYPDuRSEXbeR95mV6Nae
	w3O4cFQSzhwRr5kjmLRIkSM=
X-Google-Smtp-Source: AKy350YhCzO1/A8DzoSDutUqw/zDg4P/WX8y65703/YoBvnXXjHwwsnEgvSFrXD/8d9Xf1dtG3j5gA==
X-Received: by 2002:a17:906:148d:b0:8b1:7e23:5041 with SMTP id x13-20020a170906148d00b008b17e235041mr5035502ejc.39.1679727963696;
        Sat, 25 Mar 2023 00:06:03 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id a12-20020a170906274c00b00926b944676esm11392917ejd.131.2023.03.25.00.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:06:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Adam Pigg <adam@piggz.co.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject:
 Re: [PATCH 1/9] media: v4l2: Add RGB565X pixel format to v4l2 format info
Date: Sat, 25 Mar 2023 08:06:02 +0100
Message-ID: <5915883.lOV4Wx5bFT@kista>
In-Reply-To: <20230324151228.2778112-2-paul.kocialkowski@bootlin.com>
References:
 <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
 <20230324151228.2778112-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 16:12:20 CET je Paul Kocialkowski napisal(a):
> Represent the RGB565X pixel format in the v4l2 format info table.
> This is a big-endian variant of the already present RGB565 format,
> which has the same characteristics.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


