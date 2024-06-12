Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034F28DD1
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 05:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718169171; cv=none; b=KC4ac+XZMIEp42yTcqLT0SPEo9EZvUoGB2G91s9SNRmi5zVoElHodkHp0nx+8wXWMPL5RCI+Uy2aHAB6JMFrXqliLumRUXcM/ZQUkiBFyS29hx1plXHZ4x0Ahs/Oxd/ht3viEDqHiYpZ/ANism/65Q3oviTxBaZABe2JwKFxJWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718169171; c=relaxed/simple;
	bh=4pF36l/gMFQ1zJGHnzh2PchuRQyb6cnNwZJVevdX7lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXvyKCXnCemvlFaahQGcgBBiXFhYkgkyZXovdNW7ssie+qiX8CvR1XSguAv6qputAJ+qmcgCFVToM0MnxX2C2qeo+Ug9cTJUUKfijIN6BJKnQdU2xmWYc+XWOYE7zAurdk26mKFiy+GY+gcNM6LGJ7XbfrEVwTjqf1DXvExs1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ESraC2H5; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ESraC2H5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718169159; x=1718773959; i=wahrenst@gmx.net;
	bh=4pF36l/gMFQ1zJGHnzh2PchuRQyb6cnNwZJVevdX7lQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ESraC2H5Z//g75f4UamXmrzPkCTjDE6xZpTF3F4T4M9MicF4Q0I6eH3cj0WxeCB8
	 RIc4VEJqF2IGRJUdCljryV5DuiPO7J+ts0xEjxTZp0buiFdce34I9UbUOg3iafjNO
	 Ii0An/swvVECraBMCops17Zhz2xNaDeGM+Wx8o9rkYXFwKtfL9gxt6EVe6SxZWot1
	 2VeEiXcvWvg5e7+j2S4duJ31v2lZPEn1JLI8xJhvE1cMFQUVT/XwP4ta6zqEhk9n9
	 gaE+cxO/K8cCwgFpCh9Jv8k6kXy8KQpKnJkqMBZQGXZvWrosEmlvVXkNyVhkn7/bs
	 RhqYGd5XvrZ7nlB+bg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDysg-1s9WWg3fRE-009Ysk; Wed, 12
 Jun 2024 07:12:38 +0200
Message-ID: <edf098c3-23cd-49ed-9271-690185873c3b@gmx.net>
Date: Wed, 12 Jun 2024 07:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] staging: vchiq_arm: Get the rid off struct
 vchiq_2835_state
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-6-wahrenst@gmx.net>
 <20240605071109.GG879@pendragon.ideasonboard.com>
 <f01308d9-505b-4c57-af6b-b3febfd98112@gmx.net>
 <20240611212253.GF10397@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240611212253.GF10397@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+lgzZExllE8zD7tOExgO3kxrMJgicyIYSjG+3wGJ5JfNS5I0Qk3
 ieDvvgklmJfkd2k0w53Z04CcLnTG/VvsjUv/jgYqjtjJPrlCemsWltHap6bHfxDryECCDrs
 n3xHBhy65mL0aSRAnPBqhJHFf8SNen/jMxr2IeS1DNne2lL7g5isCde67gVdHUZ0q0iMV6v
 mfV95zOt1xXqrfJIheE1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:08neoE4lLk4=;OANuhnbkfy8GIfg2TIPQB4tGO7J
 CG7Vfk/b9ny1urLqjDN9zeEfr4GgOo4xVT5u4f0zKciDuyfNsnMrJRBzfnwwTgcLIq8ry77/6
 cQKEzx3J/Kgz/n++GPg8xJGNVF81ZH4R4zXp2yJkw5gv1Jkrq14ER7WkGO+EHVIwS2uFFwNL3
 z5i/8YKDyG/AT+4H7WGUjpo8gXP6ejrkWtu/RFUuFZrQoYg8neWvBzvH+sde0+G9xzEPk7TKH
 iqytQbJV+6RLNtcIeJHn4yPaEUxxtEl56sZEz8oD7a+rCTzgbq4/gDsQ+t9UzzucfRmF4YW4O
 x3qkbbVNCW9rczv9cweeTaS/erfec/g+q2RwiOqcyjfTRlWvRabgNZ1wkyOU6S/1/tCJp6WWL
 yvPPsLngzd7NaClfSLQaBjUEdnHHYKr3YDzm1LiPGDuPknB9sa0imIgg4b1GVQhz3u2/mo2t0
 JwS0pqBq7NCIpstZx7el6Z3vNz8mSVvIL5KDsYFhieD+W6yw9JzgevSzDpDjuNE456/i0fQ/C
 JBHMLqLi8AjgqBL2UH01HBWigVOCB4W2bUwXTbBbsbsMb2QTIxgjl+vI5GwRu7GsIf3C6csPF
 aEi49xx+CLLk3Jd4BgEqh9rbLqN4oSHAHrFWNt8AnOlg+jg6T+vlgLoYKLxVhziu3sjmstUtG
 0+4CostkjkSxodp8cu7PIvuHZF89UDn9VSC6wLjmPzCNetZZHTQ/DjLw8XBzBUAlYWqz53SBO
 B3M9R+lsgrV6Hd13ktPN7p+Reo3LSoaGUodG9yp2TqDsV7Wf0Ujv+lBZ5aSUMyVt+UoELjw7U
 yxqSBPg4upgrvthayNxGFj7knA6hY+MoVxSnKCRtFyeaU=

Hi Laurent,

Am 11.06.24 um 23:22 schrieb Laurent Pinchart:
> Hi Stefan,
>
> On Wed, Jun 05, 2024 at 12:11:41PM +0200, Stefan Wahren wrote:
>> Am 05.06.24 um 09:11 schrieb Laurent Pinchart:
>>> On Tue, Jun 04, 2024 at 07:28:58PM +0200, Stefan Wahren wrote:
>>>> The whole benefit of this encapsulating struct is questionable.
>>>> It just stores a flag to signalize the init state of vchiq_arm_state.
>>>> Beside the fact this flag is set too soon, the access to uninitialize=
d
>>>> members should be avoided per design.
>>> Do you have plans to address the design ?
>> by using kzalloc and assigning platform_state at the end of
>> vchiq_platform_init_state, i would consider this as fulfilled. Or do yo=
u
>> care about the possible platform_state NULL pointer?
> Reading the commit message, I thought you meant further changes were
> need to fix the design. A clarification in the commit message could be
> useful.
i missed to mention it in the V2 changelog, but i shorten the sentence
there to avoid the confusion. Is it better in V2 or does it still need
adjustment?
