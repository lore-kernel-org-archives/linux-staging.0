Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967582C95
	for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728723744; cv=none; b=h6+s9t9bMIFIAhvSMsSMY//60OSEEUauWSiF45x3+/BoknoomKykGez/j1uw9uJLD7SMFeUNwHnAqDJaCOxUEZJN4Cp3sN/RHMGc5k8W4llSstj5wK8fPEoWamex+onsWlalwr7+eTxojGeNJdajEE0yogaW0ReOv5yLZ2av1/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728723744; c=relaxed/simple;
	bh=rZh6vfa9FM/sP0FJ+fphIVYs0b3z9acSZjbQU+/mNbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ii4jxm78NMlh+PjAwfVJ7l3soXZR4V3cj/cRvk6Ld+Y4ZMjvTtGshfatH5XEGT//diHVO8jDRIHQUytYzksfR+JIUbEqHXd2vUT9T41Z4jora3zI2O9R6OK6GvIZzqJnlcnTBi9SVVR9Ko40h6wVK/cbV0EKmmhwQCx6IYjAOAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwsowO6k; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwsowO6k"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a99422c796eso451035166b.3
        for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728723741; x=1729328541; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/kcGfRfPlVt/tclzZkb2ivkl8163plsBDXpWRzmtQQ=;
        b=iwsowO6krqGoMEj96xtHVnZAsLc4M89vKwHCiDXGIeogF+Cj98IrBoRRQTCJKx7K7C
         X5QEEr/GS7QQ9GyQMF+4A7B+wNxjY+k8jK9HVtIk3XvMs6E4krgfqqxWwPOE6HU1scHX
         hBrbd43F7D/gAnIUvoemqzK2PHdU3CvSFZzoklK/9d7pftxgVeEOZd2QRxXD8JHqZ0Cy
         9fPWL4vZ+cOzkPvzkJubBttccIeIFt97OK0W1VzQexn99g7RpO3Fyw1Wbc+WuLK5O1T4
         EwOOppimKm2+wtZkx9azmLV6hwu/+Fnt4eCFwe0Y9zB7+ue5ffBsxK5lxdJ3XeBrJbi6
         6d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728723741; x=1729328541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/kcGfRfPlVt/tclzZkb2ivkl8163plsBDXpWRzmtQQ=;
        b=mHYAT0KbnRYOuhJ3okIPZaH+wB5Poat4A2UDEc1LBreh1f0RBnZBiTOrxkNS7NGxRF
         OXfNz3FKbBL/7jTeJzF9sNapnSpOKGkHM9GqE15GxbC1FgJ0JZSy7VgSXdWyNQkMTOY2
         fk9DQJ3HlWozyi+yjqIMubtpgY1SPR/5qUNRFqDkpzLeMbImIAGJ3oc4r31/cR3ab6ah
         BVYchxryYlijiirh+yeNo8mmglPGGK0kudkgeaoKNkLWsZ01I5tavWNCDPXcThpCXbNN
         xNTagTIB88H/uoWlZX0gfEnj2gUBpQL8mcI55yIntSZOmuGeJUNdYa/NOWEx8ZLaGCMf
         CvJA==
X-Forwarded-Encrypted: i=1; AJvYcCULvQ8eVcHbOof9Hn55ji9pCPzlvbkxofp7oGKC0CVzIDvhxIIGX8WhbXlURzDSYMGfSX3TAZKe7ufKKBDk@lists.linux.dev
X-Gm-Message-State: AOJu0YwyFP8WN2We5qjFIdquOJRnWkSDgL7/AXbY2uVyL8W6fWwZNtm9
	gh8nZgVaUaMFiOHlxD61Qr18w+/X4u9Rn1A8jLdf+rftqpdOOlqu6l/3Sg==
X-Google-Smtp-Source: AGHT+IH0qErR1If6QreOu5RpvGcEJkncxp3wyOu0m/11kXBgN0QvqW+OW8oN5bGN1LFc2JgCGmA98g==
X-Received: by 2002:a17:906:c14c:b0:a99:435c:89f2 with SMTP id a640c23a62f3a-a99b95f5f72mr518372066b.63.1728723740742;
        Sat, 12 Oct 2024 02:02:20 -0700 (PDT)
Received: from [192.168.96.164] ([85.255.236.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5b0aasm302481066b.92.2024.10.12.02.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 02:02:20 -0700 (PDT)
Message-ID: <b2ac0a21-989b-4f36-9bb4-923221a77fb1@gmail.com>
Date: Sat, 12 Oct 2024 10:02:18 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] staging: vt6656: Proposal to delete driver vt6656_stage
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 Sathish Kumar <skumark1902@gmail.com>,
 Florian Ziegler <florian.ziegler@posteo.de>,
 Pritthijit Nath <pritthijit.nath@icloud.com>, Arnd Bergmann <arnd@arndb.de>,
 tdavies@darkphysics.net, m.omerfarukbulut@gmail.com,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>
References: <d7ef2954-21d0-4ddc-85d3-1334e7270ced@gmail.com>
Content-Language: en-US
From: Malcolm Priestley <tvboxspy@gmail.com>
In-Reply-To: <d7ef2954-21d0-4ddc-85d3-1334e7270ced@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Dear Sirs,
> 
> Forest Bond contributed this driver in 2009.
> 
> The following points let me propose to delete the driver:
> - This driver generates maintenance workload
> - This driver has a maximum 54MBit/s as it supports only 802.11 b/g. Peak throughput is 3MBytes/s.
> - ping times can be 17ms are often above 500ms and worst case 22 seconds.
> 
> I suggest deleting the driver as it no longer meets current expectations.
> 
> Former Maintainer Forest Bond <forest@alittletooquiet.net> is unreachable.
> 
> The staging subsystem needs to focus on drivers that support usable hardware that is available. Newbies can then get the hardware and play around which is fun.
> 
> Please consider that support will remain for years in the longterm kernels.
> 
> Thanks for any response about your thoughts.
> 
> No response will result in a patch for removal in 14 days. 

Hi Philipp

The vt6656_stage USB driver is still widely in use, I still use one on my raspberry pi and usually get me out of trouble when main wireless device fails.

I do not see the connection issues that you describe and generally the driver reforms well,

Any b/g devices devices in the wireless/staging tree when used with or sharing with newer ones will have connection problems due to the considerable interference.

I have not problems with deleting the PCI vt6655_stage driver.

Regards


Malcolm

