Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072AC7F;
	Sat, 25 Mar 2023 07:07:13 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id ew6so16013787edb.7;
        Sat, 25 Mar 2023 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679728032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Q0JH6W4/yY2MilP9/4zYKwAOQZp+GiB+9fzoz6C1dc=;
        b=kUBMkODkInJF27YtBQrcC6Nm5HrEiTr+mNjOq2KIOYwWKfd47NPu6ebm5shYZN1cbp
         VxxdDcljYPc33BNhd1wQQQsCe2g7P8cf2ZmX4Q9UeHNde212WYIo+8YZCs888vY3TeB2
         I4qvzTyb9KAYxfHDn3kBU8kDkjVAW/GbeEhXoTkKrLWqCVHZucn+ozpQ+XjybpxoOwg2
         muB2bouPnn/eRMkFhT4jPT/cnCQKazH3RCtrALN1MQE5gfq6aQSasLOQR5QYAzaI5D4q
         ouzqF6FB5whyLOvtdZHCrAeOm4gqpy4bdUsNFtslhc96F/p6OT7i8bimDngCi0cWaQCt
         DbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679728032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Q0JH6W4/yY2MilP9/4zYKwAOQZp+GiB+9fzoz6C1dc=;
        b=tlsQd8pyGRZBx+M+0QVPnqGx3f17fbxTJEKVe7iRoDtoHp1BBw4gwRKgnKkE5m46TG
         0G82E87avVJui9SNEEPkhlnc0aqKzHnU8gKwDPAq1UsI60zfyOEXr/QNRHjUN1ICDrI/
         3VBk5SxyCQqOO/Etvs/L8g/hjb0DiyWumm86B0jlWhPUkdb3f+ulKwP2mei4NWxJO2bP
         XCsgIA1/YTzR7FqcJrFARhjuqzeABOWK1xPSMI6VAd2hmXwrb/o8GkR5WQXQ6dunHIc0
         ymAswbLLHNFuRH+ZyesI9lqtbYVZeUjBKzI2Itjgs2QyDiyWL7jh6hXG+KiS5Ho1QMk5
         GaLg==
X-Gm-Message-State: AAQBX9d+e3XA4AlJx0k5D3rM69qWnnNMn9ZP3c6js3uYxI9OoA2ugMUo
	kg1Gi1GqMogNICG9N6fuZjg=
X-Google-Smtp-Source: AKy350YzkkEr+eWLFvy3HtMXGEGhUEod/T9NIEQXirQUXevaNPV0e6du5VZvgcfYic5BjjeA7SqNiQ==
X-Received: by 2002:a05:6402:3445:b0:4fd:2b05:1722 with SMTP id l5-20020a056402344500b004fd2b051722mr5004664edc.7.1679728031897;
        Sat, 25 Mar 2023 00:07:11 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u5-20020a50d505000000b004c09f0ba24dsm11801358edi.48.2023.03.25.00.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:07:11 -0700 (PDT)
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
 Re: [PATCH 3/9] media: v4l2: Introduce compressed pixel encoding definition
 and helper
Date: Sat, 25 Mar 2023 08:07:10 +0100
Message-ID: <4786897.GXAFRqVoOG@kista>
In-Reply-To: <20230324151228.2778112-4-paul.kocialkowski@bootlin.com>
References:
 <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
 <20230324151228.2778112-4-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 16:12:22 CET je Paul Kocialkowski napisal(a):
> Some pixel formats (such as JPEG) have their data compressed and
> encoded in a specific way, which is not directly YUV, RGB or Bayer.
> 
> Add a new definition and helper for compressed pixel encoding to
> represent this situation.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


