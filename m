Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C487F;
	Sat, 25 Mar 2023 07:06:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id i5so16267050eda.0;
        Sat, 25 Mar 2023 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679727993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI9BdI1RMucEwg1yGgAeBp0D0QPkZDZvGWjMZQrZ5bE=;
        b=Kk5Kzw2q4va2tIe3+E7MWgytldyRunLz4mGaEAZVXEJPwGi24i6YsFf5v5Ixlfz0DT
         KL1stOfXNnX74QI+1Us9df6XufKJe0E0uUHDJPMDbSOeXIUt7LXmkCT9ZDPe9DMLRk9C
         55w7oaEpGMKpZAkFIq9QoY5rieHQ0tv8snNKdUOTL0XSSeY8VQm6HGLQXh5lXMKyuxR9
         d3aZIW2egWshzcyr5f91vcexeoStua64eswyNWg1gQlHqEN+EaH/Dxcb3zaj1bUMY1Ra
         dJ3V1SvbxWZKQbw96eaSCFWfcJ5/ajgcg81zzisHy0wVecSr9bGxocu1bvmnrR/ZJ1XK
         JCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679727993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI9BdI1RMucEwg1yGgAeBp0D0QPkZDZvGWjMZQrZ5bE=;
        b=KjMM6HojIwbvGmkLaSsEWZIbSER5R4tR/cynHqXDn5mHEhkOA2XsQRvMouG5b36Vbs
         2QAOzbgNd/iqep6KeowcOAOd7pqh0eR5AfPMYXpwI6Z9YWUk7VN5HYquAL4zplocELmS
         lA4OQsRUJ73E7w2kMUAc+0FhmdXHa7R7WS8FWZ2Ixqe9IxRin7y1Wu58RY9b3VTDRrGS
         V5h1HM95eiKj5cHIo+s8lbVgt8irMh4Y+BXWlC7MBA6es7CehSi/vnH1S+8MlSk9Jieh
         MpvG27n5hx2n2AMrAlSWOQ+Z67pcXT6V2W1RA7OJhC4kVBDs7s3YfDrpBLJ3BZUNL6Cd
         I/uQ==
X-Gm-Message-State: AAQBX9c13P1481nfU+uhDhbK6/12GKkBRzV0Kd86mQz8iFFl9LcBXmqp
	4ubJygKpHj47AXoXUtGMkfw=
X-Google-Smtp-Source: AKy350aWHeIkzysz3ySUNTjMdqcaw2bucYZprHzCtZSo3Gv7NktWRc+ZoORqrlQwqnfA/JZ3mOOWNg==
X-Received: by 2002:a17:906:8601:b0:7c4:fa17:7203 with SMTP id o1-20020a170906860100b007c4fa177203mr5225344ejx.63.1679727993390;
        Sat, 25 Mar 2023 00:06:33 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id kg2-20020a17090776e200b009334219656dsm9634636ejc.56.2023.03.25.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:06:33 -0700 (PDT)
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
 Re: [PATCH 2/9] media: v4l2: Add NV12_16L16 pixel format to v4l2 format info
Date: Sat, 25 Mar 2023 08:06:31 +0100
Message-ID: <4468709.LvFx2qVVIh@kista>
In-Reply-To: <20230324151228.2778112-3-paul.kocialkowski@bootlin.com>
References:
 <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
 <20230324151228.2778112-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 16:12:21 CET je Paul Kocialkowski napisal(a):
> Represent the NV12_16L16 pixel format in the v4l2 format info table.
> This is a 16x16 tiled version of NV12.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


