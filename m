Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511CE4B04AF
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003508; cv=none; b=LaPE1uKkL/gRS8mczaJn4jMERQPmQztWdGBGGRe3YXBb9cTnZG3PULljd9p7FlzHg9tw90A13Hz5nJ56SaDCWmo/YF+eZAnUwoz9LMbSIGmmy0eFUmP9tCtCY9VQpGRnLdwCFhHZXc5ew3Q9dsZFW34W50wAePKiwUkR5HKtnh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003508; c=relaxed/simple;
	bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=upPRP5d4/D4XqLdnJ98B23A+Q5HFkYYGGXgKBOAoQTTc4AKN+DTGlGhctRwfgBA6BvId6bkL94Kfhk/hbkCH3X+sopYnp3HvP/MgcV9xuDTSp4j+7oIyN0x1OZ+dxbI+bobb3asQWGSd34nRzqEA7iIGVHm+Lo0gmlGGgy7i3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAw0UzKz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAw0UzKz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2410987f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003505; x=1787608305; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
        b=eAw0UzKz2MUtFXiR3KJcbKDVeMiPAneREQmK0h2q7rQPmGqRIU4CwDTZv3FxovusCr
         aBpuAdKEEzM3dwbVm2EE5QeUFcblycIkncDRO+/Unzkc+TeGnBAYsvqnopBOFAn1ZFnO
         UcMjujMJrfVru4EO/3j7xbQkyiSmdmyngCec0u3k0QR3d8QLes903JthwTmkdTK0JdWY
         eTBPoJ+/Lq9Ln0YskcaZR/tCmDmVFbqGr95DWubBJWYoPwRuuyu+uYu92RprWHDwOt7q
         b4B9TuI6KcQTVhn3NJE38haB3yZZr80NyME5bppUqSNjPsyyMisMnVScF1ChJ9rIEsug
         aeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003505; x=1787608305;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
        b=SQZmfpHOrTe85bQpTZYGIeHyeS16nlWj6iXNNYKRLYA2tFRfezKQbts044v1+qRPwH
         MLcg+QHq4hxNTlaJLZebK6Dp93Ja+YYDb0vOs84OrlfxWnHbzf7NOtcEadBl2joX1mE8
         d4kzFbz1N26i1KrSmn2vs1fnSQ6yYzzzZTUusVLhTMJogP4IynY3gbT+r0wmpplw88af
         PB6QU+UVnAthKgE1lJx5g/WDSYGQV7MLbBGWhS/Pr2NOvjsi4ypV/DkEc9CHgtvcTEyp
         zu92P9B02ZGWDWbTSFhAD6seLjOnbaXHVzqFu2m7i4jmnw1qn9ub5zk41XBbYaaHSDgg
         36SA==
X-Forwarded-Encrypted: i=1; AHgh+RpMUn6OOfek/7cUK0FlxBManG0kIUcZFGw5KeZ+PPUcLqGFECTeDkkcPjnGB3NF9gwgc3CIhgeeV7jleUM1@lists.linux.dev
X-Gm-Message-State: AOJu0YzjBWkhIFnKtAnD/FITYTmfKoh1VMQ/0/DHSpX8dHgG0BqWJNxI
	cdSPTHnszHXKrq5stk3iMOWWvzvTZAOhv1S9V0DePmBidlKHZAwKno1n
X-Gm-Gg: AR+sD12q/+dE095Tg2FEEgi5afeiRd8ui53Egj57JDe3CHYihgidQ8b8lXR5cJ3QBJv
	kkJa5qKWGpO+qsE+qsLE/A6frpoiYrVQ4DB4OpwopzTxIyQ4bnmn7EZuFqDvc8FIHFcZUa93LPx
	nzJuWAQM2bEva3lC2UtVjaMSmq4WYYlqSp6BqvSZzxc4BicQh/MS9PHE52vNei925TqZcAR76pN
	65d+10RfRL8mu9dPxT3ZJQsxhtF69oOscqPgM9teSlROQ+wvmacYejZCdJZMK32uaA3FrvO3AlK
	H2RQ2+rcB5/yFPfV+X3RD/Ff2fDV1N1opNb50y30u8WecJhBCF94Tq+Telvi9vucXOVOqEyx+4s
	my+9G4ivmBPx2/3rk9gdR9S7zmZ99XqglHEB4x5hGrhnY8l7MEcE1tZ7SFptnCbNPIl0BDsnsZz
	AofPjpnuA0PmIFy4YNaNCfE3X40SaQUX5InCtYnV2ycwOvDI+3dsS6O7kt9I3QIZVca3HQPLlVn
	+352aPgUCn82/m5noJPNqqGOHDimo4k/d3AD7/GFn/Lt4kyBFEGgcs=
X-Received: by 2002:a5d:51d0:0:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-48160723e00mr37583370f8f.1.1787003505347;
        Mon, 17 Aug 2026 14:51:45 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm7267823f8f.31.2026.08.17.14.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:37:34 +0200
Message-Id: <DKRJKMECRUTC.125CT60ZV5WKN@gmail.com>
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>
Subject: Re: [PATCH v15 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

Inside the err_revert_mode path of max_ser_update_pipe(),
max_ser_set_pipe_mode(priv, pipe, &pipe->mode) is called with pipe->mode
itself, meaning that the equality check at the top of
max_ser_set_pipe_mode() makes the revert a no-op, yet the hardware keeps
the new mode. Am I reading that right?

Kind Regards,
Artur Andrzejczak
