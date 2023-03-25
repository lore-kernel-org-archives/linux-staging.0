Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E897F;
	Sat, 25 Mar 2023 07:08:20 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id t10so15975238edd.12;
        Sat, 25 Mar 2023 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679728099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhCjNke4o6htNuSSLMhV34Z5L+JJwT2dpRjptiRlbNA=;
        b=FSP+zdm04PUFXrHWmmUhgTQEBDdojePDUHJMnf+5Ee4YjEPld2dNeK+TcNP0WFcZzV
         KmC0aWpSkLlNJt1KfpszcQ+UtUxVTapfshN+YIR/qVc3c7GfDR96HoDrKwjWBcER3bPn
         TnD+NQyYV7y6BnGV0qpOxsCX4hi+bWzT3UwMlcS63XzjjTXMS7cNZ+td6nfp3YfmQJva
         0lL4kV1n58k1XmymwRwDLL9GQ3cLzAMIJUzqfMlvUAgXz5js9VGcTup8oFoBAc2cy/Fo
         EvQ061n8s2I0D0V7aJjojx9nAOroEV7ET4T5dccAZWOT+lZEx6Tg5bSN+TPN3qmuWEl9
         eiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679728099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhCjNke4o6htNuSSLMhV34Z5L+JJwT2dpRjptiRlbNA=;
        b=IONjCihtqcc5g1LapwXDikQI9LRrgDrwkIZ+0we2+OxhoEMqwRqX3MmfBUb6tIizqQ
         HyAlJTu5/83HgGaOvIF06MH7GXfaNUjt6BVpqY/BoHUq7sW5IG/oBT3ZtiVdw4iq2RYN
         a35B+iRRgT8xk98h3wmKL9DIzzuoPQzajXq9E+Epltua7CkJjIG+5OY+6EWl9TrbSegM
         A6WOFkM8CuBFVDvewYoXF3pdkaqJ07PuLU0E88c/OAH2MpCYd57K1YxBpEh6UTn2P7Z/
         vBdGQe9wCS+lNItbZ32IaKuYA/2wTMt0EsCHRg4YAMD9on9aVVPTdTU4sJ/ENHMRd2dv
         B4nA==
X-Gm-Message-State: AAQBX9d6xTiA6mpWzzTzqrTp8awbtwk+iLbz9aX7EROC15auQsD0Db+5
	KEnxUtyby2DevIdOLkdNwYI=
X-Google-Smtp-Source: AKy350b5jXK3iNNla2GOfg9iEvFexE+B43iDNSO9KQERX/FasFstxWwyw7TYoALYHn35CrkWN91GTw==
X-Received: by 2002:a17:906:fc2:b0:923:c199:dab1 with SMTP id c2-20020a1709060fc200b00923c199dab1mr5891132ejk.55.1679728099311;
        Sat, 25 Mar 2023 00:08:19 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id sd13-20020a170906ce2d00b008e09deb6610sm11299252ejb.200.2023.03.25.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:08:18 -0700 (PDT)
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
 Re: [PATCH 4/9] media: v4l2: Add JPEG pixel format to v4l2 format info
Date: Sat, 25 Mar 2023 08:08:17 +0100
Message-ID: <2135691.irdbgypaU6@kista>
In-Reply-To: <20230324151228.2778112-5-paul.kocialkowski@bootlin.com>
References:
 <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
 <20230324151228.2778112-5-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 16:12:23 CET je Paul Kocialkowski napisal(a):
> Represent the JPEG pixel format in the v4l2 format info table.
> 
> Note that the bpp is set to 1 which is not a proper way to estimate
> the needed buffer size for a given JPEG image. However the compression
> ratios of JPEG typically allow fitting the image in a smaller size,
> even though extra metadata could increase the total size by an
> arbitrary amount. Thus it is not a perfectly safe way to calculate the
> size of a JPEG buffer for given dimensions but it still provides a
> reasonable approach.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


