Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795169907;
	b=n9hBV3zj280Gi0unb3mplF4JWjqNs/FR0CS/Ti4rj2sDI0IfeJrMYJMszDxJOJalGwlR
	 yZLXZwglDD9BY99KCqySoIyUWDO5X+c3TdpUmMEbGd427KR1G+AcKEn79ppyIY5zji16z
	 duHyA9SNYfbLy0p8ZewAzLqunNdLATwg4+otpM9hkknijup/u1WPwGILW0PDFGHORVFgQ
	 IwlTzq//Cdov2XMrESLl+KJ2wIVWYna2Uh5dU0kc3OKaLlnBZOKbWmEdaHAg+PJcM+UXP
	 jHM5QnGMGfCVxFZUtpBT5/pjmvnvadbL0RaE6F9FoWh1scIbeg7ChrX0l+duxDD6Klw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SNWLb0L+OWBVvvcB3v+U+hDjyIksqWir4fqKX+sD6Ls=;
	b=1sYfGXTrJJlHVNBsJVOLha5LLGYZCEpa+4O3DLD5RyaYKbWYWbZedy2LXaU7T/oN/j0m
	 pewaVjhOYXGlVUBRHiQqude52PJQso0Zq30NEk3E0SLdFSy+7DZnwpsqCO4kPY1rXhDkr
	 kEli54UVolLsTBA6whdj10BcVDqa59jNDZZPabG2O68RbKW+boBlX4MuCQzaTZbfuKN01
	 sE9s3UkAQbS2AaRuWuPF26WJ3ecIR1UO3x3eHd+xJbBPWjdfL8eW9tbvGyRK1fQcNNd7D
	 Nu/n1MtRmxIRAPQal1tUSYwUtfhMmk3HmsIAexquplUwJTXpxJRvGUGjYI2L+g8iXqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X9et/JaG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1957606A320
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 10:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1957606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9et/JaG
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be1e468a8so725272d50.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 02:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795169906; cv=none;
        d=google.com; s=arc-20260327;
        b=k/Z/OqWzUPyzStn/faxE4R6rXoK2B6/Wn12YuQJ/SXdAuw0sooKFzNxba/qgHEh36d
         Rjdjhtrkd7PmlrXIiWhUBGk0rMlSUsg7c3isAkPLLL2mqs1U+/GnZ6yF5Mp9lS0fQgKf
         STm/5TgxzHNDuN8tJWJozvCLisT19VvuEYac8QkOQjOl3azojscBbvUp33d++74HDhXd
         ab9dodRBr8R7XyGBU7YVzr4ie2VKIDDHHnIGUpdEaPOMmPvKHgfE3kKyye7sjYA/H3em
         1L/povFS7AF0lNsIP732zKczqbYCR8N005n6wynw0IgXBmvPNok/+bd7gL+Bp4YZr3AL
         +Ykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SNWLb0L+OWBVvvcB3v+U+hDjyIksqWir4fqKX+sD6Ls=;
        fh=IIACyI9CSfenX45S6cRdV8e1JACwdj6nvwLT+wV7A5A=;
        b=MR/h4rAJJt+siklvf0b5txDGdIdf7WUSuXKsOUmIUgXwCFRIfMvdPmsZWaBMRG3hty
         hwHwHR7k2qz7PIQ43S12+JfngMvafAeiVs/TJvPzMQqfWT9bgwq+M7+DrVUeXkb1N2lK
         soiSZgEhXYl69yBZt58b5Vg+EHlG7HPLOyr8CSwWH5HvONKNl7CzPdAwMS6eZdmSAEW3
         k7AQ8dsAurZpWXO5y9QTvCwjq5eYcO0CHuwkiOjSI0vmnf59nhglIm1SVGXGNF7INN/c
         gtc8lMRdCZ+stFl/u3ynWtjQ8Tt1Yye7knIyghZwQQX25+48CQj0w2MHXhELCiPmLa0/
         qbCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169906; x=1795774706; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNWLb0L+OWBVvvcB3v+U+hDjyIksqWir4fqKX+sD6Ls=;
        b=X9et/JaGDbn+d5MejZU5iiJ7aJfwuO2UkQ6MwRgajWCxH1CHn/r3o5RMcjiHMjpB1a
         6AZUVOABVUbZWw8CvQbdvwFlF91tZl/zCP9jfawYK/UhNkbKBa7OUDrOmfafjLbe2rzn
         rIKYMLHKf1sufp+uyAk++YHMaipxRWk8r4g1mp4ea36DXqzcqeo/qxSsFCjEXNOBfs2B
         kNavteaZ3rVt9BEyl7jPoWiWSKmYT2GSEqGL1JYFeoVZLNipuRGTU6xY6s7YouF9H/tK
         JOSBo5WsnrgpAHdOBxsFMjeuYDBmJu8e6WlfANn3Q2ZMBtLpZjF/yBWk/glg6XfBRYhP
         HKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169906; x=1795774706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SNWLb0L+OWBVvvcB3v+U+hDjyIksqWir4fqKX+sD6Ls=;
        b=oMgJXIv48jHxA3eJErbUOgCiPoxa49fUA0B0lFIMogC1AkZhGWTtBjO8pwZP++tMEe
         u+F6cyjXV3JeBie73qTUuumH0hs0H2xWjuUWtnuJfo+AvqpTDZng/tegBllO8RMTToJ+
         9H5/BCEy6hBo6wcCTbCIecyK6ilxqiQ9wWtD7NHTH93qCPAZUKzyumFghincIvQLnSEh
         hZfs4LjNZ15H1KtHqye7p7rE5eAiiFkhynXZwsJYr6U9SL4l3RP6b9lGBtcljVSsmR2Z
         G4Kipn/FakEzYNtQTyRFREtVXkvM0EPL3Bt1wsrCq8R2c7oVcjyDHfFNjAtj7edWWwoC
         ee3A==
X-Forwarded-Encrypted: i=1; AL+hErEa0d01uh9rsUrNj77qYk3s1m77keEXtBP4pC+TEiLEDWLZlDEk/p0usZcGs7dIxsseFUwnwDSuXbqvZQbc@lists.linux.dev
X-Gm-Message-State: APuU4Z/axDZEO8yRbUBZex1vCd4km5dxaGb2VsfhRaWQNeiJ27xA3qdJ
	TcQsH4grq9agySUY+g6495tUufMcPlRrB/s2O4wfwSgVvZfhL89vR7SQbJv5IwBJHLsyWdZ/x2g
	dou60yquYQo18vfcXTunpxDCGz+xyvbE=
X-Gm-Gg: AZFdTZdliEu+71AhtptzudwLFcCxNIp2B/eGqudaoXX0ce3MNRO59XjmY9NB6sWBw0t
	IMFsxRyturIjQHPh94CU/Vj5pXgZtPP6vI3UpzDrCkXbKnVEJ2ymXs+IXjZzNurdmhOpoSkk/Ii
	af3wApucdvPCcglcHVVPC7KKHy224HQ+KDJaZgi+Iy5Xf7J2bX1NfbFsM3gRFc33+ZbHGRZBWHb
	DZU6kIDa+mbp+TcRmP7f60MPhKHFLqcnfKOnnFIKZiH8bFVhdu5yW/SE6H/DRoqYOUqpXvYSA7D
	RG/ubSD9mL2XVDU78frjOm23wdIu0n/VnF7cPM1/bzM7SJncgjHzxTEuOSkhR15PfJha7fAvOZ6
	hBu3Eso0zC6Y0eHF/phyVMq6U1o4SmN1UGN8=
X-Received: by 2002:a05:690e:814:20b0:67d:e499:b2ab with SMTP id
 956f58d0204a3-67df4441bd2mr775708d50.71.1795169905776; Fri, 20 Nov 2026
 02:18:25 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
 <20261105202110.1081296-1-albu.victor.m@gmail.com> <2026112048-dimmer-ravine-ae33@gregkh>
In-Reply-To: <2026112048-dimmer-ravine-ae33@gregkh>
From: Victor-Marian Albu <albu.victor.m@gmail.com>
Date: Fri, 20 Nov 2026 12:18:09 +0200
X-Gm-Features: AclHuK-qOUJSVTytZZc8wfC9XpvLA8OMQ4xXujI6KM1rGr8r-cqUyLmslYf83H4
Message-ID: <CAE5KA-NS5-yJXAHUofgmyCmWyjbjPSNdoQZi5+iPwZKabVbbyQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: most: dim2: add missing Return: documentation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, christian.gromm@microchip.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	parthiban.veerasooran@microchip.com
Content-Type: text/plain; charset="UTF-8"

A few had no Return: at all so I added one, the others already had the
sentence and I moved it into a Return: section, because kernel-doc
-Wall only looks for that. Nothing needs this, drop it if it's not
useful.

thanks,

Albu Victor-Marian
