Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC473234
	for <linux-staging@lists.linux.dev>; Thu, 15 Dec 2022 13:26:36 +0000 (UTC)
Received: from [IPV6:2401:4900:1f3e:7d24:3f0:3e81:fb16:ab4d] (unknown [IPv6:2401:4900:1f3e:7d24:3f0:3e81:fb16:ab4d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CA6F327;
	Thu, 15 Dec 2022 14:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1671110794;
	bh=HnKrMknUHi+HOs7MEYvKhXwHku+eB8f9y8CAAYYGjKo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lZI889/NbJHCxunwbjm8X/mClzS5rHT8R7Hor5toEc9vMbVD3uNTySZjaQ3UycrpQ
	 SjhL5m4vfmHv8VZefATVChzIm2mZqWAir/PSJLx4ZN4vfjRMiype6kF9u2qVULY4iB
	 L2qFr67Md1uMn8819/pE7LClnFhZLyYWHx1S3Uu4=
Message-ID: <c20996aa-5c12-4af1-ae0d-838610cfee42@ideasonboard.com>
Date: Thu, 15 Dec 2022 18:56:24 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/7] staging: vc04_services: Drop VCHIQ_ERROR usage
To: Stefan Wahren <stefan.wahren@i2se.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry
 <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221215065853.34477-1-umang.jain@ideasonboard.com>
 <20221215065853.34477-4-umang.jain@ideasonboard.com>
 <5c963fd9-97c9-d513-a8ae-5d3f22ef57cc@i2se.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <5c963fd9-97c9-d513-a8ae-5d3f22ef57cc@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

On 12/15/22 5:00 PM, Stefan Wahren wrote:
> Hi Umang,
>
> thanks for taking care of this.
>
> Am 15.12.22 um 07:58 schrieb Umang Jain:
>> Drop the usage of VCHIQ_ERROR vchiq_status enum type. Replace it with
>> -EINVAL to report the error.
>
> I would prefer to use adequate error codes like ENOMEM and so on. I 
> agree simply replacing all VCHIQ_ERROR with -EINVAL is easier, but 
> wasn't the real intention of the TODO item.

I agree with you on that front - I am still trying to understand the 
bits of pieces of the vchiq driver as you can see it's not obvious to me.

I will try to address this is in v2 - after the series a bit more feedback.
>
> The rest of the series looks good to me.

Okay :-)
Thanks for prompt review.
>
> Best regards
>

