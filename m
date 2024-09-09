Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D83224F6
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725905315; cv=none; b=UwoBdV2KmW2KcikxxQf/EbgAUFZg58OrlIto7QarzxvnsA3tbGg0rsfy6Lo3Whr5A1cgrYx0xYLlfkfnQeMFtReuw2vzvv3pSNdzqilwZTcFv8KY59v8IWRXvRgvp4H6lBY60HlIBnTItQ49wLvEFIB088+SC16IIm+TlStlh88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725905315; c=relaxed/simple;
	bh=E7pH4adNZ8uz/CA0aODZ1IPkGgHESUhx1KYLBJjldw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XM/RjQzBZbXSpn19Nc51fqjKxXuv8jnkmTBeMNHCOAy0aBjsbVDCDNGxnJbxZtfwUap7IeaW9WEAJTLXDQTEcjH9CBjOuJklFvRGOUV6j5OKPKKFaM8igkCj5eW6SQFBpsQwIJJ+QzWLXwZCKAJelPwQNRbBPj164nM/PpeaezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=MNUM0VWF; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="MNUM0VWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1725905301; x=1726510101; i=wahrenst@gmx.net;
	bh=uF6LI3ZHNmXWGCan5SlS2GHLmWzMTzCr44imqA17edE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MNUM0VWFVjoGASFBJFaThyBnmtH/1FD6Vv6M3CHus8rtp+7XgaXccJjIKSp+fVnF
	 DBP1Jrsw7+j5x56yuGoYwHoCXfncCnv6mnWhYvf1ox8wR+OtjselYZLpfpJD3jr5h
	 bzMm6oo0CEXcnwWMf82hiu49NotrpX3O6lOFOfHHoT/2UVHBcwQ0e7qXSJgOiehB1
	 1tqyrwd3Ml/D9COZVU6jwbCm5MfXaNcgMaoPoEybPiP4dC5wbhIJTW9pVrtVWoVu+
	 T24jqtTSRLD0T9KGoXiQUFF4B9N7tbdYqb6PyEA2Sui7VyJr1pXIMnqlxu2oy+IZo
	 8z3er62Q2SzYh1Mirg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.128] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9Q6-1rw2G84BRk-016LZd; Mon, 09
 Sep 2024 20:08:21 +0200
Message-ID: <58767847-e2d9-4e9f-8d8a-7c6f14d270fc@gmx.net>
Date: Mon, 9 Sep 2024 20:08:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] staging: vchiq_core: Refactor
 vchiq_bulk_transfer() logic
To: Umang Jain <umang.jain@ideasonboard.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240909061457.255452-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240909061457.255452-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:nRV+AOie4dNbLAGVdjoGNxLIIb0hVvK21E2RAt6HNa4AFZwknXc
 +O5ZecGj3e9fIVDdHFHTZiTKU/XszwmesVtiPDwBtXSe9DecymfqHLulJTo/mMLYRtEyx6n
 +Y4LzyPWYcjUU/xUlLR/cIAUGxhHiLyN4rO1xMWSdXn3iuyAOcfARIusyf3EI0r0ZYYGD68
 QImWI2N5UqDJw4hFkat7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jRL8DbcGM8U=;aIVCs6iI7dbkFgn90cnN1I7S7ke
 gRD3AbucMy33/YC9UmhMUoqvlD+Le7VUA+x29OzEzEI1qOWiu4g+R4/LbNTMof1ST/xEVo4ED
 aZM5IZC+fMj3Wha31SX2gbMXsnLIKMZQoKS7k0pW3Yk0EJZ2YAhnhhBeKRTvlXv6bjxm6cNQx
 l+ZFu546Utx+Kxv3KAEz9CYpKLpSOgSPhfa43FC96g0q5QmhPKwI04UhImH+a0rtauGItBcDz
 z6YDXsJE1z7IFHzHoW6TJXoEsUHbdJMiA3jWSGaRPka+cAHveq4kxCJS5nUyta4cJ8PfqtUnE
 4eTYr6Qu9i9osCAdeEcc3vYKWCOQf8m0s0F1WWdBUFP22yckP6h3AKEkmogtjV935GgSpLt9g
 GSc61fBSbwurdsSg8hQ6TPmaB4FUL3neP+ZQgoel1b2e9T9sNdoKfbt2BNnhYKE+4hRse2O6O
 uRcYgFIsDv6CL9F1pHnWgecxA5trk+b/c4Qyox6PTQtVjSlzSDxyO7TeeLlUMUMsPwNocLw5Z
 lHMuFlFCSXzSUAxtc9mhlKnifsZWRP6xgee+MJTt/obWvLvNe9FScYJDi/LScLNBFYe5A8exe
 romId4bjPBk+GlFxlzVzphv+z97K9iJPFlUaXp876CFLtyFdlRP/F24zQqndD/GhbyGxwAVxE
 krSGLZ0MDKlThPvGK4YYzbqp0JWEVoYUq2jD/aGBEEVUJ0BVJDCaSssfVmhWQQgvbD+BCrxdu
 d9MdgIDzoo7NrFTiXkKZWY+ENQwY/kPJ2EQlVm7FXFnY/9P1B92OOATvJuD1ejgpa5YXydPnC
 ob127onYtubUCgiJhi7c+EYg==

Am 09.09.24 um 08:14 schrieb Umang Jain:
> Series mostly refactors vchiq_bulk_transfer() code according
> to Arnd's review comment from [1]:
>
>> You can also wrap vchiq_bulk_transfer() in order to have
>> four separate functions based on the different 'mode'
>> values and have them only take the arguments they actually
>> need.
> I didn't wrap vchiq_bulk_transfer(), instead created four
> differnet function, one for each mode.
> This will pave the way to address his second comment:
>
>> Ideally this should be cleaned up in a way that completely
>> avoids passing both user and kernel data at the same time.
> which is not part of this series and will be done on top as
> arguments shuffling will have to fix the sparse warnings
> that exists currently.
>
> Patch 1/7 first moves the VCHIQ_BULK_MODE_WAITING logic out
> of vchiq_bulk_transfer
>
> Patch 2/7 then moves the core logic to vchiq_bulk_transfer()
> which can be shared in subsequent patches
>
> Patch 3/7 and 4/7 refactors remaining bulk transfer modes
>
> Patch 5/7 finally drops the vchiq_bulk_transfer() as not needed
>
> patch 6/7 and 7/7 are drive by patches, noticed during development.
>
> [1]: https://lore.kernel.org/linux-staging/3d3b7368-93b2-4c0d-845e-4099c2de9dc1@app.fastmail.com/
>
> changes in v5:
> - Fix regression for VCHIQ_BULK_MODE_BLOCKING in 3/7
>    (Fixes strange hang from v4 with 'vchiq_test -p')

The whole series is

Tested-by: Stefan Wahren <wahrenst@gmx.net>
