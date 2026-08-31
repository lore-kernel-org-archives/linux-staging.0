Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588AF42FCAF
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183432; cv=none; b=ajLO9Z9Fj6l4fZRiAAh1E9Qz4V9105hbA/mdV1xuGo3aE1V4NZbu3j6202OqViHCCH1s7Qe8qJwDF6ZphVbuY0Th6dE1aOsBlGnGPGHtr2Go8YSJnlbTkWPHX5Hv5CuhNRcO0lG/AzJHrIteX+hz+HEbaA2luz3ZweqYzUnp8nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183432; c=relaxed/simple;
	bh=+crV5aMzmvsMqDok6yibOvFk6mwHBFaHijEaoyXxk2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGRsm1AgrIhL8iWYGgdKhuypqlhmMtIIvaba1HY82QZKmpe/Xkbols5K0ou/BBAzzhMx88K/JmAR9/tV2+SX/PwiG0cpiJZ4qaJUJv8xg3FdxQrLq+LnOkQu2WZeyNeTB6OsHTcGrA5ACsL27tHbPA+mmUxD1W1NRHR+yktyYUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRR5+myg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRR5+myg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49954b88fffso24124065e9.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183428; x=1788788228; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UmvoqbZ8X/pbBv6+Ee4BUY62pNZyn3Ji5DwA5JfziI=;
        b=ZRR5+mygeYDzEG6sleYPCQlO1IG73+lqOQQR197O2lRDbpT8w4Eudw6J2u5xZjvulY
         rXchEIGg7WFl/h4XkJbmb5T3Ws9hzAJxRSOlgbc0lug0u31jwsEfEQzvl56rG4e1J55f
         p0RTEPELpnH2Jnd/JQYXcGb1hGDfWdHqhiEkpqISu7lj+gxonAStlwYjyPHGdHw7KwIs
         HuAJj94iTQSBEeJOiHtTNDpQ3h0YPeg2XO3EZ20fXw0mG7BybYx2E2TGg9FsC9I7p+n3
         yeF9qBEjckQazeQa6bhP3sFs0l0frrpucJ1ZaCM7beaijcKlXXae0OeTSiXln0ZDOIsE
         Mphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183428; x=1788788228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UmvoqbZ8X/pbBv6+Ee4BUY62pNZyn3Ji5DwA5JfziI=;
        b=cBt+jYN4bn+bfBU4wMusaQ/eaY5rCAZwRy76g64A2dOoJ+bL5THVdvNKA3BHMjE3Wh
         EsAoOQRfrnYpbebDmYSBULRDZVORtulyAOS+cFEJNPihH2L48uDbw3p6o8TUVRUu98i7
         KCcUTDOBXrcXYHLJ+3s2iA/BBA3KO4IAKqlVrl2DjM/mf03yB0aS9SxSIUgEtOMNYqTi
         hMYz3vnGdCVVcs8Awx52CTkSg9dgtAVt3kGBFjWRpImSUwSaSCScCbt3Jn047aY+OjNG
         GOM+Errj5zRdLVKTzdz3ecE6CWm9KZTqaQ+dn2QEka4znff0jHuVICUshJdjQYjtm5al
         q1+g==
X-Forwarded-Encrypted: i=1; AHgh+RpaNsFVhgIySbY0J+Lw9PyLIobUvD6nZwlc0D2BVZUGGLfjG5iltVQt9Cv9q62sbjCyGPEVFYpH1Y6mPS6f@lists.linux.dev
X-Gm-Message-State: AFuF++nreaW51kjeQLTvTHmCYxQ89t9e3+divnrNAt8us0NLQmO560FC
	pq9U9n6yQKPSZqy0sxi/Z4tZ37oxm8G6goKBBlUwpH70LEoP1PlKR3Rp
X-Gm-Gg: AR+sD11UQhOfOgr78ewgh92eZKSqQzM9QSIgDsk2deS4eLsUoEQE6m0wSGJfjmX/CUY
	u9ZHJHik10k4SiUAZ8P7cORvsdprYZBpS5J9OnksKRCZZCKSTt2uKxWdGSDq52zVS0mFKxSJIKw
	9jM9c5DxDzr9rPeIRjPzQZRPVmxuINg3By1lxi8SHjmgMAfGhetfVAX3snkrsnsFodyIPyTdDTT
	MOJYM9R0Zl7iZNm5diEUPCUoO5GxxGj+EcrRLxIho1wBnA7hv6b7/KQNbrO+Gwd9dFr4x7RuXE1
	XbhePFX9REVmM1cJsEkT+BIG+W46zSC13z4OFDlt0gNauzdjnHEwQJKjCMjoyYQF95KDFzh6DNo
	jr7XpkPz2M2qTfQn5BbSLKvjv420n77xhXNU6wWkt3raJ8QfxP2cki+ss6XhLPrz5bxZ4i6+sZ5
	U2ZoqSW3OdpIuXcbSWefkBNEurChtJ2k8rXIkDcGwD5j2L0YBegC3lLMuSZKCLwRk=
X-Received: by 2002:a05:600c:a03:b0:499:a8bd:1930 with SMTP id 5b1f17b1804b1-49b91c20ba0mr375282175e9.5.1788183428335;
        Mon, 31 Aug 2026 06:37:08 -0700 (PDT)
Received: from [172.31.2.29] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm346376465e9.4.2026.08.31.06.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:37:07 -0700 (PDT)
Message-ID: <f48c0b59-0d6d-4b99-8990-2473919245be@gmail.com>
Date: Mon, 31 Aug 2026 16:37:05 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dumitru.ceclan@analog.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <d0537d7f-6e74-4cca-93ae-398530c5cd51@ideasonboard.com>
 <ao_5LDgGjzvPZVXU@kekkonen.localdomain>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <ao_5LDgGjzvPZVXU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/27/26 11:45 AM, Sakari Ailus wrote:
> Hei Tomi,
> 
> On Wed, Aug 26, 2026 at 01:15:03PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 07/08/2026 16:02, Dumitru Ceclan via B4 Relay wrote:

[...]

>> The deserializer TPG gives me no frames at all. I recall the clocking for
>> the TPG was quite a challenge on at least some max96 serializers, so maybe
>> it's related to that.
>>
>> The serializer TPG worked, although I think there's something funny with it:
>> the initial frames (maybe just the first one) seem to be truncated a bit,
>> there's black at the bottom. Another, a bit more unclear, is that sometimes
>> ser tpg stops working. If I'm not mistaken, what I did was run cam0-tpg +
>> cam1-tpg. Then I tried des tpg. Then cam0-tpg, but it gives me nothing.
>> Streaming with cam0+cam1 video "resets" things and it all works again. I've
>> seen this a few times, but there seems to be some randomness so I haven't
>> been able to pinpoint it, but feels like there's some extra state that's
>> left behind into the HW.
>>
>> All in all, the normal case (non-tpg) works ok for me:
> 
> I'd indeed either fix the TPG before merging the set or postpone adding it
> for this reason. :-)
> 

With V16 TPG deserializer and first frame serializer issues were
addressed. Also, we could not replicate ser_tpg not working with this
revision.

Thanks,
  Dumitru
