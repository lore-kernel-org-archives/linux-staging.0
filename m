Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542A3BE623
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 21:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003515; cv=none; b=WQvbjgcHDQlz/eclEHO1tXM4rxYx2ry0vwgbYOVNIOwfQlpSTOFGlyOxrqBwNrugitRBM4uGIjB1KYnjrCOzd6DOQYr46rlHFnRdOMUtW9izMmF9KwAnvQqqL+xXz/tFGgvfZeaOILFMAGSIlc18kVrHP5yAAZ7DvPPLjrIITI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003515; c=relaxed/simple;
	bh=xJUnUoMS0efqPdEWh6VyFBSW/fIK2d8cOEcdE1MOroo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Cnl1X9F1kKGqCZxsgh2fcokrTmv27HbgSvhmrKbw2IInaRomO835GhVm2Hiu2lw4URRxJi+GPJaHUCNO9GUBViQDNrNfjm6jf7U8wltPNcu+8C9bDaTMtIgdV7OCtVXK96FlKrlhG5Ha4T4k+tQmntQZ01lfjWlL+/1unxadVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljuFpD1y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljuFpD1y"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472326ca506so2745248f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 14:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003511; x=1787608311; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xJUnUoMS0efqPdEWh6VyFBSW/fIK2d8cOEcdE1MOroo=;
        b=ljuFpD1yL0yDOOphtKUVHHncqXiZtKFCnV8PEfS/m1/R4vhLdqkwHO0+kHpxw7Cemj
         K+VMwwSSBroNesF45yM7rRkyDrLzyNJVOLcgTsZA+UBtp/4bsiLKbbbkSIzS78E1X2zQ
         dXTHL1ugiSR0xjBsL0qpjUbUUgTmjbag794r6PuJ6K08ykzIXqRP/RsmK9fwauhslHl8
         oR/WDuEHKMNQwzY1emWv9n9fNNHA36Lj9RMdM4d6UhX6utRTFo3iF6Z2CQgf014zLnva
         dMKVPYtGmZUv2EcNxAKeAi/T7vC0roL5cbzY+PHpQOOYDY6HKOY/+3Lvk1RSx3lACAiU
         IUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003511; x=1787608311;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJUnUoMS0efqPdEWh6VyFBSW/fIK2d8cOEcdE1MOroo=;
        b=p/d1jpkZjobfwjfOJy3a0BAoC7mll/9mGrKem33hcJwY1dfiwkqj9cmnSOBcMYMJ6a
         Gxk6xX3umT8qZIKA+vz65O5BGCgRbHXWrfq6U3ruUUU8HxePkMryS8huhOG6yU9rO26f
         enesrVVV33zm3vUCW6MKx2nOyZPkxovzwXw7jk1wHB2WFjxXnE+RQskX2xDk7G0g0/qY
         dQGxUICMH2m7ZpSBVNzzzUNoDlE/Ld7sXExIovpbfhpcIYtCkQcIWELgSlDSa7ZmtfjQ
         2dLQnS73l1FQUxQjcT2Eq5Gv4QncJHLQOROV2kF9TwoZHboF4vI/weeLL7kiYVi2kQ3Z
         HC9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqoyCjXTxz3/s7fqe66a10Mn7Ldm9H5uP4AOwFL0I3fhxycHD/0noHAeWhbbqBQwUL2/c1M4lzZfcck/QVX@lists.linux.dev
X-Gm-Message-State: AOJu0YxGWG/soyrGVUvwumEk0u7oyZ8yD9kYlUfYCTxU0ZmfoxprQuIs
	XrhVtk0kdfhTQNE0vFoHCLb7tYL8V/Xt+sFhGTd8W6BmPv6ihxBKWh1Q
X-Gm-Gg: AR+sD12bgzFmjIDmLjS/WROvomfkWkQvJs5STRdxd0zubBYyhB6cFREwhQ6twcLWW1U
	Fn+xPXKFskNJ3F//oy9jphOuDO+ReJa8PEoBm+VStCqQsLqoXN1++9iV7ez/Pe9fmcr+bLpmrPE
	SPKLX+02ca4JNVZrW4BDvVM5KsSszNAEG03FlsIHprTxw3gFkkNyah26+Ny6hyb/g/VLGWnQUXp
	oOZZnNugrxrixkWeIEXol+fDmJKimBwf8NJSjV+czgmNL01MFAPl9lmZDygL8Pu1Df6HhNJ5hLP
	NNmdEuVZhdHmjeUb3/vZvQ6BS3RXlC1AwzLuSWh7TX4NHIfNL2rR4DUsO5c7EUZOe5N+RmW60ne
	DUSbyp/2T9g6jSB/8KcOlhLTpRV/SKVDrXMNDnrdokw6rogaNHXyzLd7UM7p5fh5fyzjljCFJfZ
	oHeL56plAdEpH6Zr39SFiEdxiSzczEIcRCw2JBvV+QOtC4gsldg1jG3kuWfJOal4easpb53OECt
	vOd7t2Egvwr6gP+lZh41m53p8ddVdFQH7hcNypVYEAFPSGf9ZaIKmU=
X-Received: by 2002:a05:6000:4201:b0:47f:e760:e5b9 with SMTP id ffacd0b85a97d-482a903c1c1mr4995812f8f.18.1787003511415;
        Mon, 17 Aug 2026 14:51:51 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b51asm6988840f8f.11.2026.08.17.14.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:40:26 +0200
Message-Id: <DKRJMT8IZSXS.2GKM3OUHXHTK7@gmail.com>
Subject: Re: [PATCH v15 18/22] media: i2c: maxim-serdes: add MAX9296A driver
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
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-18-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-18-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

max9296a_set_tpg_clk() writes MAX9296A_VPRBS(0). The comment states TPG
data always lands on pipe 0, but don't pipe_hw_ids start at 1 on
MAX96714/96714F/96716A/96792A, with hw pipe 0 never mapped?
max9626a_log_pipe_status() already reads VPRBS through
max9296a_pipe_id(). Should this write use the accessor too? Also, is the
"max9626a" in that function name a typo? The file header and
MODULE_DESCRIPTION say "Quad GMSL2 Deserializer", but isn't this a
dual-link chip?

As in patch 17: could the 200 ms sleep in max9296a_select_links() poll
link lock status instead?

max9296a_init_phy() enables D-PHY deskew when dpll_freq > 1.5 GHz
without checking for C-PHY (max96724.c gates this on !is_cphy). This
might affect MAX96716A/96792A.

Kind Regards,
Artur Andrzejczak
