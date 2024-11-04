Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCEF1C2334
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718422; cv=none; b=RJet2v8krkRIinbgJABpF//gCXopJe5ZdJL5A1P0dPmF+0x3Y4IS+HAoeu2NpAanRXCzC/CAfJ8uNRhZlBJUo6XLa/+eU0LZybzMRBoBq8LFs0hR7T8IhoQ9gWJP7fhd2YUL6dzEUMS5gQTv0UPyBLuZ4UDId+1nkgiscezLtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718422; c=relaxed/simple;
	bh=iWEcRni2Nz57qu3SIoY4cH7ciaJ7ffC2NUZRr3pjvBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhYPAhTxUvoP2LlBcKHKUdBvu5suxyuBzIrXJ9pmK2iFdiiL8OORY/xdBAFhlKgiugq1p/IDLpSEq8WxBjcosZrpsHgSzyk4p8nRJSQjbCg9lvBv485URJNw9ZoiJSIZ/tHi4PA22P+CybU67qwEvuWP5lcz3WsSTABtT+KnSfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dh/gZDSy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dh/gZDSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730718419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aqiu7oURVUgREvheU0sljhA5Rj0o+9UF1lmo7768lR8=;
	b=Dh/gZDSyd0btM3N58qlI0Yb3t2NVB0QeTrRovkGp5Nv8zqnzsYXASjemZEzlG4YxmJaDlz
	xEj0g3grsJGhthYo5oYtOy5FsroEtYZ76/uFwYPmEz3SljRjVjKonKZpqpDrHBabiLyKac
	Zr8NE51F5sjjdzTM0jNJ+vFZAuVU/e0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-m0wSLaiUOayTOVlhOBjteQ-1; Mon, 04 Nov 2024 06:06:58 -0500
X-MC-Unique: m0wSLaiUOayTOVlhOBjteQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a2ccb77ceso321599466b.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 03:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718417; x=1731323217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aqiu7oURVUgREvheU0sljhA5Rj0o+9UF1lmo7768lR8=;
        b=NRo42Am/GHDRCMiInSy/KYV300d6dX2OrqbPpWpL2Vrix7jfLfEjDmKEIB9tOQV4qU
         3hJ2SdRWA3gfOqOviVlFgJWedvU/vA3VJnaPT29yT9FHnrzgFa0nLFre74w02LTs90/N
         PJZK4XopZCK6Z4NwrOvgk3f4lvz4zZ7Iqo2spXO2xuyJzDvr40oxnAGLrdmEzxoJqXKo
         YDLF4g5qt8crEihfM8Uz25+VbB6gGCC/FOW66XUWqN5tb+lMVSJlrn5PrNX9nvXDfiqE
         hyqq/R3uWqY4phtepTUYqSTRcABehFXy8KP5eEWzyclDUd2HzX1LT4oNInBr8gcQjtlj
         Az9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX67kq6endzWlUv8igx5AYs8T8Jn1Azpg9OumFP++u7IBSq+YsbDlY7l1vQorxHfeunyihNUDPw+eYswvgd@lists.linux.dev
X-Gm-Message-State: AOJu0YwTAcbAKLNMoubhSUhDMEeKH/EZDRXCJ1PgC+i/x3iO7FBVY5Dl
	m/utFiy8hC1fJNWFPfvmEjiPFBrC0MfrBRfHqMpfRtpbI9uGoZpHAV6juK3wuNbZX4clCCrQxHs
	g6Xqw+FqEfUx663iAyxGwOrnC63KneEjJGle9Yt/R68fzCc5O7TRs3wPIjxfbfjU=
X-Received: by 2002:a17:906:fd42:b0:a9e:211f:7dc6 with SMTP id a640c23a62f3a-a9e211f7ebemr1452830366b.8.1730718416979;
        Mon, 04 Nov 2024 03:06:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG8/C1gs96jiTZYAtiRvsfoTzByztC2AqrZZ9D66KqXv3ZXWhuOotsEYjq0Pl8VfNhDEd1zw==
X-Received: by 2002:a17:906:fd42:b0:a9e:211f:7dc6 with SMTP id a640c23a62f3a-a9e211f7ebemr1452828066b.8.1730718416361;
        Mon, 04 Nov 2024 03:06:56 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564cc5e4sm537362466b.89.2024.11.04.03.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:06:55 -0800 (PST)
Message-ID: <8204d2bd-50ee-473d-849e-77115fc5adcf@redhat.com>
Date: Mon, 4 Nov 2024 12:06:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: atomisp: mt9m114: Make it work on Asus T100TA
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Robert Mast <rn.mast@zonnet.nl>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241013154056.12532-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241013154056.12532-1-hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Oct-24 5:40 PM, Hans de Goede wrote:
> Hi All,
> 
> Since there is some interest in getting the mt9m114 camera to work on
> the Asus T100TA:
> 
> https://github.com/jfwells/linux-asus-t100ta/issues/4
> https://lore.kernel.org/platform-driver-x86/e0c8c98f-64ec-4297-bbc8-de489414515c@zonnet.nl/
> 
> I have spend some time this weekend poking at this resulting in this
> series which makes things work somewhat.
> 
> Note that for now this will only work if you modify the BIOS settings
> to change the ISP to be listed as a PCI device in lspci:
> 
> 00:03.0 Multimedia controller: Intel Corporation Atom Processor Z36xxx/Z37xxx Series Camera ISP (rev 09)
> 
> If you do not have this in lspci then things will not work. The BIOS
> does not allow changing this setting from its menu, so we need to
> use the grub setup_var_3 command form a patched grub.
> 
> Note this requires your Asus T100TA to be at the latest v314 BIOS version,
> this has not been tested with other versions!
> 
> Download grubia32.efi from here:
> 
> https://fedorapeople.org/~jwrdegoede/grub-efi-setup_var/grubia32.efi
> 
> Boot this once and then run:
> 
> setup_var_3 6f
> 
> If the ISP is not visible in lspci this should show 01 as value
> for the 0x6f offset.
> 
> Now change this to 2:
> 
> setup_var_3 6f 02
> 
> and then reboot. After this the ISP should be visible in lspci.
> 
> For more details on how this works see:
> https://hansdegoede.dreamwidth.org/25589.html
> 
> Note this series is just a quick hack, the proper fix would be to get
> the new drivers/media/i2c/mt9m114 standard v4l2 driver to work and
> atomisp does support standard v4l2 drivers for a while now.
> 
> I plan to take a shot at this as time permits, hopefully sometime
> within a month but no promises.

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


