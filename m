Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E32B7F;
	Sat, 25 Mar 2023 07:09:38 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id x3so15990193edb.10;
        Sat, 25 Mar 2023 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679728176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/ujjclnWN6KTk5hPb9bPEGuHnH9sHPNMeXaNyMo1OA=;
        b=k0z1HkfqgM6MV7LVa6pQFGBeC3p+S49jZ3AiOa5iqNJeoO9nydVGJll6iVMav6iIN3
         YzGNORS7NT+LWtGATl37V2TJC9aY0pXlkicNJkMmGTRpIh1XJ4XrIrGuKtQIPBuYjMNQ
         9uIrvsfIoTjNq7jbMXTHEVn/eXtqOoUo81MCtbpZ0uAAcNpGEpgxki/J8om4wiU8n36/
         kczUdX2CeyNjZPDAy+t122rwgGwUqo3P0Ai7+hHZ0Jt+q6VgitrgISOVDT7mJUAj9/oT
         iRiBUDnRmDHBHw2jhVD3n4Rl6kU8s/mVXiL35Dn4P3VhVOdB3fG2GXs/Xy8N4SxEBfSO
         Z8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679728176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/ujjclnWN6KTk5hPb9bPEGuHnH9sHPNMeXaNyMo1OA=;
        b=7NFqlnM1oZQu7R/bQxRKmAaDszAxyxrOq7dL4BxAlat92mHXcBpRLQtESG4MKjyHoF
         UZVGcI0pSxS8/IxOLYA2L9FfvudxomCZTQiQjXaj+NzuzWqR8mnMk/cAZC1yVadUKlhZ
         U7a5B7p3KjwCUyrR/SpSSd1A9h89WtNOkScqOGmaGvZUpyohWK+JIPmjSl6fssnYeQL8
         MoJGmr0CQtf9j8P5GKwC6hWDmMUUx085bkXpv62MVXWZdcAaCAiUP/ChTbts7gZnhkHM
         n7IlTOUbxUCsV8USyUS6SUJ9NispQ4AKHhP5LLVUx/nEZsCgJoMLnoaDgFB/442pumFH
         oBtg==
X-Gm-Message-State: AAQBX9fQ40Y/0z4vafSSSzlXZtx8J8fdm7BkpGk0zam3NgEQng/ixQjh
	u/Z1cU/CZICAZf7FIMQIq6w=
X-Google-Smtp-Source: AKy350Yrm8NxzzWwq4tTErI98MNS8Ww+7IHh20SBFhf2jmwE3850/8lWC0puzBAICPFykXML2kpL6Q==
X-Received: by 2002:a17:906:da07:b0:931:6b2b:a671 with SMTP id fi7-20020a170906da0700b009316b2ba671mr5421623ejb.65.1679728176520;
        Sat, 25 Mar 2023 00:09:36 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b0093348be32cfsm9448552ejk.90.2023.03.25.00.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:09:36 -0700 (PDT)
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
 Re: [PATCH 5/9] media: sun6i-csi: capture: Rework and separate format
 validation
Date: Sat, 25 Mar 2023 08:09:34 +0100
Message-ID: <2872678.e9J7NaK4W3@kista>
In-Reply-To: <20230324151228.2778112-6-paul.kocialkowski@bootlin.com>
References:
 <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
 <20230324151228.2778112-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 16:12:24 CET je Paul Kocialkowski napisal(a):
> Introduce a new sun6i_csi_capture_format_check helper to indicate
> whether a set of pixel format and mbus code are compatible.
> Most of the logic is taken from sun6i_csi_capture_link_validate,
> with extra checks added along the way.
> 
> Note that v4l2_format_info is now used for all pixel formats
> since they should all be listed in the helper at this point.
> 
> The motivation behind this change is to pave the way for supporting
> the mc-style enum_fmt.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


