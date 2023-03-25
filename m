Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED87F;
	Sat, 25 Mar 2023 07:14:03 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id eg48so15988887edb.13;
        Sat, 25 Mar 2023 00:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679728441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWC7t13+yzJKdf33Wl8MOoOE6Dyz7GFsv5BEcRRUPMI=;
        b=mQ4V8zVELcJI0INzGZXWfTYFACbbMklaA+VtqoJG3vbnnpHMRW87/2lOemewUQBciR
         4k6wMnHHWDs778NuM/xZUl8oL1fDCF8uIwF/L2NvfRh+ENLan24DX1FEPpHDlaiDEAtC
         14H/00hJWH+OR5/9VtQCkOj+LXlZDAlWNsBnq5AAjtSyvyEv/Nm65eW7nWBfNDyNxu8n
         UaW76rPj4i09L4jJ/7dvxZ3AOCn9St/O8dCzzz9rMr9Fhsa9yv1PjebVOiO1/K9zztGW
         zsv0ar31+0IZEqiub/N6AoWzn/1oSSaSvmgCv+d17lTTztl2NAq+ErECuO7I9lCfd2nF
         xM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679728441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWC7t13+yzJKdf33Wl8MOoOE6Dyz7GFsv5BEcRRUPMI=;
        b=57LrHSzz+i0mu16wbAxxLOdcvSPHPgsJa+bA5l8EOrb4Rxhp9zltSEZA7AF6aYzpo2
         XUsV3D8b+in5xHRRQtnEPO3Eyh5X2Lw9sb9VJ3geJncs5JCcyvV7j3NjOeFQfhD/U9ty
         n+571KuG9a/JGV75w50YneQtl7/V0riXwS0X8deS99DQpN0ZSs2k0Y8qtNoaFDAzpE30
         gu4SK49uy4RcS1dYsvcjtwu1qn6SXN/CkZtTKg0CBt4s1gUTVCjm41UnTQ/kNkOhvXvV
         HcbNYIxwiHKu9sQGQhuHGjScpKkwR67Rqnn980tJnoqNRetaKt0uBhSjHm4fZxhdG0fH
         bQMA==
X-Gm-Message-State: AAQBX9cssNN2ywWyQ06yi5dGwem+kbS5iQP7KjzZxDpMPTh/w+NEJwzr
	zjWXJp6kbxH5lmsNTeznP40=
X-Google-Smtp-Source: AKy350Zd9FsNYacmYccxCQNonh7CGTsJFdHGVJxR8WVA7Wue84dPL3PQHv8WFWNAsq4rS3e0y2+qJQ==
X-Received: by 2002:a17:906:608f:b0:877:573d:e919 with SMTP id t15-20020a170906608f00b00877573de919mr5089636ejj.20.1679728441559;
        Sat, 25 Mar 2023 00:14:01 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b004fb556e905fsm11811929edc.49.2023.03.25.00.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:14:01 -0700 (PDT)
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
Subject: Re: [PATCH 7/9] media: sun6i-csi: capture: Implement enum_framesizes
Date: Sat, 25 Mar 2023 08:13:59 +0100
Message-ID: <10243594.nUPlyArG6x@kista>
In-Reply-To: <20230324151228.2778112-8-paul.kocialkowski@bootlin.com>
References:
 <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
 <20230324151228.2778112-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 16:12:26 CET je Paul Kocialkowski napisal(a):
> Report available frame sizes as a continuous range between the
> hardware min/max limits.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Co-authored-by: Adam Pigg <adam@piggz.co.uk>
> Signed-off-by: Adam Pigg <adam@piggz.co.uk>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


