Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE21CFAF
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711397315; cv=none; b=ugcl6tcXy2eJAf0s4nKW9Lws1bCqSSwGBvw+uTF0eSGMHYcVb0/kRrsdkPl5YgaC9lo1vIT+zLI9U9BJfvSgDq4RZcBQ0Wg6HfRzjoo1KPi7ezL2vOj6plnBJZcVKu+RonlcqJc0bYoTc+oY1qh1vtS/mXyQ+gy8x2Y53ah7WSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711397315; c=relaxed/simple;
	bh=IjuxdHFO8cTcPCYWNzoDCm86BnzP3oIfsTOJhV2smf4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cG/9ks9UjX3bOxvyox00jkvxGWkQDqcXetytxttZerqM6rH7Myu2oocGPRTSfkHb/ATji0lLd+gBQGdW35DpaBupyDZqG23cuopyS/ezcugAyaFebYKzu5SjdoGs5j+f1/EclAfN9shQc2g5re230ZbNA7dIfQGnjMwPjdZINmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgCabpr+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgCabpr+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33ed7eb88d9so1382168f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 13:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711397312; x=1712002112; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjuxdHFO8cTcPCYWNzoDCm86BnzP3oIfsTOJhV2smf4=;
        b=HgCabpr+XQugEFK3nn+yQwU4TFx4dJp0XY2k0EudZ+E/1/Bcj9RrfOesz01Z95sMye
         C9IXLO+seFzNuo/HJYMbNnK29sW8Y4Sw3fasVbWZsaNdIl7Ndw9FHG/i3wYLFczm3ix1
         Wq7F2VUuvh/6zyeYVQ8+5aMHF2avPmVmdWTSOW9oKrseyh8dB6+xPf7RFw6FN4WvFaF/
         QfwN9a4Snz1DSt/Kt2qdZDeASoG5MkEUt7ISiUghozzJXBuAyM+NsekrHnvLuQrmpqsG
         kYw+1T/R65tMn6c2mX/zlx/AXi36Gxiqvsvzxa6PzrxTUPoP8y0ret24qxoBZ6dpWAw1
         hE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711397312; x=1712002112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjuxdHFO8cTcPCYWNzoDCm86BnzP3oIfsTOJhV2smf4=;
        b=vdBqP4SghFfB8EEF8exjvJNjUOjE6a7a2lAMq9H7lEhFExZtJBGGjasVOstkWIQPEt
         RJFSWKNNNMXkbF70QzSKfLD0w7J/h+7C3heXjjOOqIxvCQFH5J118uw8q/4d9KXR2v2q
         aqKIgAttlRRLz51bX2P6ltJWhJ7GPUl/n+m4ErEURWBEsre9PzyRhLFvlbUsdyI/4NMX
         9VPJxfXyMqIw4DSVsc7IGdLig8kViyKzcOW5M9KlJa26m+tI04GMsZvfawxhUVUaZ50n
         bwQhk/aSRo/yMr/FupVWYrjb9025ZcLD64fS1YLVG7hJWG3XRGvZoimw2UK25BnWRhP9
         se2w==
X-Forwarded-Encrypted: i=1; AJvYcCWP4JcUVT12jqQY7gxXgQ16y7ijV4Ga/iBq4NK7ujCVxG6dQNFIGYmsJUU6tcwrO9DmPADZ/f6W1rTfshJLeRr5wmDkHKRH8UxacSyPSg==
X-Gm-Message-State: AOJu0YzEp5ZEO+3lKeoKsRBPZW/q1b5lEnVE+T3URKJdIgUCYnEafIhH
	UM78tREE7JQKowV9Ld9y4jWFTdx79PQgjP/XQdEWisJwsUmgHEHfSptHoLhb
X-Google-Smtp-Source: AGHT+IE8D4NxyjSGCmzVt92tVvlkAao8m/O0GYRjEuokcPLxdToDjBNIzYiecePgrlHUFTnyAssfWQ==
X-Received: by 2002:a5d:5111:0:b0:33e:c974:129d with SMTP id s17-20020a5d5111000000b0033ec974129dmr5355058wrt.5.1711397312419;
        Mon, 25 Mar 2024 13:08:32 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d60c4000000b00341ce1b64f0sm3055622wrt.17.2024.03.25.13.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 13:08:32 -0700 (PDT)
Message-ID: <15892fec-213b-4b59-860a-491d28031f74@gmail.com>
Date: Mon, 25 Mar 2024 21:08:31 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: wlan-ng: Remove broken driver prism2_usb
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
References: <20240325195112.GA17878@matrix-ESPRIMO-P710>
In-Reply-To: <20240325195112.GA17878@matrix-ESPRIMO-P710>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/24 20:51, Philipp Hortmann wrote:
> Tests on wlan-ng hardware have shown that this driver is broken since
> April 2021. Remove broken driver. Find fix for bug in link.

Missed to rebase.
