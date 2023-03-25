Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE677F;
	Sat, 25 Mar 2023 07:15:01 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id ew6so16053067edb.7;
        Sat, 25 Mar 2023 00:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679728499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kijlfd+PM0iLIZMF5+sg/CV/MasVvO3Ll6lZ/t4bxdI=;
        b=FZ77NWTfSvwT9v8ocqKeOx4jjsZG5oQfioG+yB5uQMy343Q3nOmxEvvsbJkARFtPCH
         PwDPkywFMhLaH8YuxGXhcqrtS7PdWpVXx+6W6Ro4UVAYHdmIbBT1JclOId1f4x5ceYXP
         PbqbjfdR1rBm87M/EJ0MJGXzmSvs5O4PYwsbuPFjrC9kfmaSxKG9jAvImLdLLsfIkcB+
         3RV2h09TnxpZo0CjAeJSfq/8vcI2Fj051E8yih2107elwNcbyGKBOQBn0AUu7+JNYaY6
         rSOUt15DbINLqRQxGtkDhuolo6xMi8HwEnqSfFn0SWCCA2YPunw7GDmC4P8NPacGwyek
         c2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679728499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kijlfd+PM0iLIZMF5+sg/CV/MasVvO3Ll6lZ/t4bxdI=;
        b=QuOts99JhTO0vQtrVvZsOC3z/8M/nEXXMWk2+KKtsGBJgaZl8xygItZVuY0XCNKBvD
         VQHPxxytC//XgYHSxRCfXvu9eimaX241N9Dy7ngWZeiZixu5wFGgl8DGVhKmTakwSuWL
         au6RFXe8QMVoDd/dFqa6FR6Dl/cKvmR9sxqJQ4P1ehFLor+4AiEN6jhEnKVeX7cmV9GW
         msTs6ZKlV7tjMj0HHezafakuQQr12oswhcxPtOSnrkk8O5VdlEGBfYsCq+Qi2VnHt1Gx
         JFEooWVtXcdlyyfYyE54N+Vigrb+zXrGgiQ+0LBw9BLN1r8MOmxNsgdvZi3MWwYERYvs
         H3SA==
X-Gm-Message-State: AAQBX9cmeHP/G0gHf9QFWKzYIsBOswis/yNS2pbqhVOiWsXWLS7K2D0h
	3dv5fVtkuVZyJUakAwH6q+E=
X-Google-Smtp-Source: AKy350bVXqlcE3R0ij4TuNgV6ae2ij2U7WNVD9/hsIPrrzW64ZPAegx3gEMchmCP/NzT8DnQVmXMEg==
X-Received: by 2002:aa7:dad3:0:b0:4fb:999:e04c with SMTP id x19-20020aa7dad3000000b004fb0999e04cmr5766278eds.38.1679728499360;
        Sat, 25 Mar 2023 00:14:59 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i23-20020a508717000000b004af6c5f1805sm11822239edb.52.2023.03.25.00.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:14:59 -0700 (PDT)
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
Subject: Re: [PATCH 9/9] media: sun6i-isp: capture: Implement enum_framesizes
Date: Sat, 25 Mar 2023 08:14:57 +0100
Message-ID: <7500135.EvYhyI6sBW@kista>
In-Reply-To: <20230324151228.2778112-10-paul.kocialkowski@bootlin.com>
References:
 <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
 <20230324151228.2778112-10-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 16:12:28 CET je Paul Kocialkowski napisal(a):
> Report available frame sizes as a continuous range between the
> hardware min/max limits.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Co-authored-by: Adam Pigg <adam@piggz.co.uk>
> Signed-off-by: Adam Pigg <adam@piggz.co.uk>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


