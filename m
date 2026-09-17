Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C548A8C8
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678861; cv=none; b=khYxqo0r6qsRs2VEq+smjuTiL9G/fu2EMOM4YBkEoIF1ubHqQh0RG+zPyMwEZaCBPBqB9IzSk+ZMK3ClVi49nfHFOic5ufE5zYc9h+31cUrXxEP11N7LiFk4U4rjjF53lF6mnJOA2zJco3pdrecfFjf1QPGXHX34fJljuxDxfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678861; c=relaxed/simple;
	bh=X7CO8plt9rXRb+sFi8w8w6XkMwhE0mA/u5iv6DISDeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XafRvHC0ydizrxUuPzVrKkl4xab96yOFrLzrFfj+9GqW/PvzuW+432SStrMxvXTNqgaawZimIrvzO92MhCwmy1OfC8o4VCOn02LTb6ugP+g+G4VGDuntu6wpUohhuZwhr3+SB7V6UNZ7VTVdmGs+e+YnZjnMdxLcADdyolQ0eJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSCRei82; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSCRei82"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5b6840edcso807251fa.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 14:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678857; x=1790283657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBjt8nETg6odEPjXmUPOag2PgcmXewPZyiuP3+CiCYA=;
        b=cSCRei82A0rChfdIJ/ZfTtkfKvZunVDJQudP0P26h/b6OOZ1nXDUg6hW7SPw2MXnGF
         xmgAISL8gOz/pByMKCKPaEwvqAX3rasS/KmWrJmAfi3mn6v30eDZ16CYMCO0W1on5rSd
         800qCk6bo9pRCuOBCm6eXFYIxjrs3KvZr3VuARJUHctrg5bYi1Oa78fF9xwpXR2HCIwB
         BS232fluxyy2t2CfrncCo+XBMKyLRoYChswF82S7HeUYwUMbgFSpzZaTXHDINNZNd3rj
         RxG+qZtQSode8l5R0vgjvfNSA520oKd+fQnC4FmQplB4hj+6co4WVJfIStXt7MlIRSXj
         Soaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678857; x=1790283657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBjt8nETg6odEPjXmUPOag2PgcmXewPZyiuP3+CiCYA=;
        b=heBC+KJp4LyN9vujezeLlpAK8y14gVE0ko2wOHI93O9vyp24SMouWZukLUR/CzIa0N
         SORK3oe547TyqQj3A5ljoZZLFsFMsK2Cl250HSwpP7k3R/iUGRdW/nG0czhMJUQHUkPZ
         l5j7Eu2a5HClhv6UWI53OxBijjaSlj4BlcpQ18/015NgCl/DpnBTOwTeCPVSnM9akp5Z
         JDhwMwQFJAXjpW0b7APRdVDpsJPvbHXk2hCBeRWfc45UuYQ/4W4ZuNVC5sS4TG0BEBS1
         sCZtBF3MQ6bjwsO3XkquSHsGE1Il3piAEyuualsabEy96SK133c5zj0q9OhA5CD0/JbQ
         3Wwg==
X-Forwarded-Encrypted: i=1; AKwUvBwhJzZ2X7Gh7wRBNuXJZQJFyIG7cyvwbFaqgEFKz7/jqOJmm9+muiwjnsUXgTCDJiyshcWzaghXr2/V3qBi@lists.linux.dev
X-Gm-Message-State: AFuF++muRRGMCncg1VYxo0ua/rGULqt+30ZlQTCD7UaBUc8buxUGOmEQ
	FoFZGUk35UCNnCX2d/1kH+mwGzlNrpDpcrF13nXhqvg6NTeZiRKD+9ufunTAhNlm
X-Gm-Gg: AYBFou3qtSgD5zgHpDrZIPQn2WNVladGNcCG8OcFeVgj9iZfHkWegBQ2XKqCZRuvDwf
	8oA9IMe/+7AkdOinp31MN/M/Q6AiK8RAoF53jC7ll+BY10N4qSWj1hZ64nazas9Q0BCfC7VC/tt
	1FcyMO6b/BWCElJLsh0wrMIBhLn0rZsTlTCNOO5fXYGfFLh3L3BhiWMYu5LBTTzGXajRp4uMsQr
	GMQRpRC2PYDWb/mBxHeP5LFEdqU9IW1b3K8QT63IClRKUlK4oT+pDt5qL4sv6c/NQBXUJ/6CmiK
	QNAY6c4sWwfwMu+iQ3WUNiLfDnJhSqjxHFTMAAtV8ZWdEUv3Gf4srYcK8H6MzTN4Js2H6h5ZO1v
	kuHiS2vEs8rnO9UtHC2y4TNKSy9nRUnEJUYIjbYE4T2jloZru/BBdxKLMi6nVL10lX7iwh5Zkih
	qRt2r0GLKhp8Btcpso64HqbdTw527WbS3hOJqE8+VaedCX7dsHMnQUigBeuG6daePEiEdqcCTwx
	IsI
X-Received: by 2002:a05:600c:190b:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49eb73309d8mr172142985e9.12.1789672289184;
        Thu, 17 Sep 2026 12:11:29 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:c13:5a93:c17c:533d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5295fb9sm1057055e9.4.2026.09.17.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:11:28 -0700 (PDT)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Matyas <matyasdaniel005@gmail.com>,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Date: Thu, 17 Sep 2026 22:11:21 +0300
Message-ID: <20260917191123.592659-1-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <458017cd-c188-4e41-a93f-bd6bb123179b@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 20:24:56 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 17/09/2026 13:48, Daniel Matyas wrote:
> > From: Daniel Matyas <matyasdaniel005@gmail.com>
> > 
> > drivers/staging/axis-fifo/axis-fifo.txt file described how the
> > devicetree of the driver should look like. Convert it to .yaml file.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> > Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
> > ---
> > 
> > Sorry for adding another email. I got locked out of the first one for 30
> 
> I already you no and provided previous discussions giving the proper
> reasons.
> 
> Why did you just ignore that?
> 
> NAK for this and any other future axis-fifo stuff like this.
> 
> Best regards,
> Krzysztof

I am sorry, I rushed with v2 without checking all the replies. I will pay
closer attention next time.

Thank you for pointing me to existing discussions about this conversion.
I will drop this patch.

Kind regards,
Daniel M

Sent using hkml (https://github.com/sjp38/hackermail)
