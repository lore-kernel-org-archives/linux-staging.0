Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E8523763
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713096251; cv=none; b=QtJ+64M8qH0FRqi2DpCKAUEb0V78B7tz6Tzmp3eBtWdtlXX17cHERnFkWvMcstidn2b7sOD2JyutMb/uZVKNO/rvAK5dNEO6PPSAiJ65XUUn9G6tKmfYLHZ7MStl+ZcUv7tvKZEiJM9ghxROZAN+UUXMEzuLB9k+fLEtVzvz0lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713096251; c=relaxed/simple;
	bh=hV0aUvy8QunlN8MDba5YPXKJ7xFWhLEd/gFL9CTl8Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pChctKIegkY5Q41J/qsaZsU1sAT7tyWvgrjnlSgbW9V0BzvoTyeLBNLcJC4icQnde0r4AAL1fY1KxeO7znN0p+9h2zamu+x2mDYTqL3ZyV1hoc//EuU6c2wrsKqshdgyXnuGuyBSnX4c4IoVghF0dArUgYBoyw/MKJYvHXah6S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=RhiRhdoT; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="RhiRhdoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713096242; x=1713701042; i=wahrenst@gmx.net;
	bh=hV0aUvy8QunlN8MDba5YPXKJ7xFWhLEd/gFL9CTl8Vo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RhiRhdoTLWwtopsXe+ZJQ9L4Y3cppetdZK9gwYlDYQ22XdEq/T+1+5u1dLUlujdZ
	 d4glF29UaSlGpzV43dunL4hNRCBnLhaAp8uZ1qkMKfGOdXlODjpeaCgiFh3wvUbef
	 wMpcvfGNuHLSEtEWDHf4ph3EdXwGdnsQQYq+n/L6ROmLQX9o+2yYNQZ6hFdlzHlUt
	 o/hpGVL9LAyePSLTrKjOeJV0SVpGvNCdlRkNZOP7RGOFkkbxQ9LTWYf47LDHZYlBs
	 ZfViTEOlN05PGQEG88QdyJOkKQcVJrhqzJYT+DHuipwrA/SaUHeuwhCkGPkPZEwhj
	 8REwPXkFtcBOHTrAxg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1sB2dP2ycr-00KB5D; Sun, 14
 Apr 2024 14:04:02 +0200
Message-ID: <bc4b6666-d35d-403b-9dca-efb65d7de18a@gmx.net>
Date: Sun, 14 Apr 2024 14:04:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] staging: vc04_services: vchiq_arm: Split driver
 static and runtime data
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-3-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-3-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xGQIpnN2K6KdL/2W9m25eBN6eD116iVgKKYJHmcIB7VVZClKRBb
 /4cy/Sw5AjlLH8yWaPCVCD9jaC1FtaceKSkpVK3uWAPy635gKFyj5cPXINqJ+Poa6chTqUr
 d79nmAhwQMeIWjDlpRgqPKcRsx898Lh723e32//2FI+Gmc9n8C/xw6zmsZ1ols8sYFB+KLI
 41RlobszZkUErBjhLd8Ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O96xFdCFpEo=;1ddjl4DmVa7ohZ9LR6I2fVc++Ff
 GKhDVhu7QmY0LHfX01scbtVvXrnDkh2pJkH0SJgucgP9m9fi4TBAwgjl1x4NmZZof/aYriS3l
 F0EWs5RQprwnZqhoBtiX8aJ5yNCBNpnih/SHwr07GnYCLzYHBZhojSFoOb4XEh86xFl1kKojr
 cZsOeF5KBMsyX8xt8Aq3H64q6Z4wsQyfnFsjPyK8UTMcGxRmRiAXNuoLKNwpta0j957qCqwRm
 gXeRaa4okKlv6njXII6WSvxMdQyWMzw6ad3nFM0HY+STvrpCz+qGv4ZxZWSZKqDc3qbjVOA+e
 /m7L+VHP1iNAhPF6BLPHnsJeQN4kz36CFIScvuvoBWAc3DUEMKRn0lRtLzfHbfC1JJgDR1pPE
 7adLg2mi78HQPP0DXvq+HHke4zwL1BAWIINezlYyCggjPmSGf+g7m5pu3CkEmMp9JCkAfVek6
 BZoNTxneioXvAaKc6cNz/2JGzjHD4hkdzM3+zKz5pnqAjAUK0M2RVWJUx2L6R0bVurCETtls+
 1gEzH9urxrhqti/7ZWfGS6c2+6fRwPW4n8JQFeiFmpLdh8/ZlcYY+f8e0uZ+ynJ2GQoKWRh/c
 dbZ3/oset8r7Lzxu2TUEpqolotVHUK/WwvKRhyFC0riyGTlSyBNbn/Fukhg8ps6Y6GweKZJcW
 GRnB4Ctls3k/SXe1WeYvAehUBJl1FNIoJ/Mt5qgQFb2zKVvjQz74O5BVtyUC7VBg3IiNGeRvk
 k1eGG+9rpAR3o3NFfomKzBLitTq7bmAUz6+LlFh3RjCvElSzKp7Idm/NsQDwKJL/XgbuZO561
 z9VGkcagOg9WjkLjIeAmzCzpGh++33Ve8C3SFXTsJKQzk=

Am 12.04.24 um 09:57 schrieb Umang Jain:
> vchiq_drvdata combines two types of book-keeping data. There is
> platform-specific static data (for e.g. cache lines size) and then
> data needed for book-keeping at runtime.
>
> Split the data into two structures: struct vchiq_platform_info and
> struct vchiq_drv_mgmt. The vchiq_drv_mgmt is allocated at runtime
> during probe and will be extended in subsequent patches to remove
> all global variables allocated.
>
> No functional changes intended in this patch.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
