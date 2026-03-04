Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954A191F91
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582919; cv=none; b=p77OSgA/hxjgL7iz/yN4LZo1u5Q+P63vjDug8+jedFHkwr6mzRiBwnKFUY+93OTSWdMj+xLPv7yIINl9fxqKw31ORS0o3ooVtOS139ps8cTAS4F7hI09dMEULvB7Y0Vu7sObFY4iwHBkm6DHoRtn0XluD9xxnI70RdTMma8sp9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582919; c=relaxed/simple;
	bh=+C4qAhYyhZmC998gSNFlaGYNvO+FlBDCmTOWckGqixY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YCkPi//tMWf7GTtieEbEOtEx31BxMTS4WlUh/8RYAA3VIqGT8fFesbrFhvlmpDMGTIMNHkyvcXakvKTYvsz5npG27TGBTpdQUIYhp5IUCQyVCIZsjJy7IWOPIx2VmsmMZXLQwSn4fvNspHRJ34HTU/p7Mb3RTw5o6P2YKmhP3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdQuMWsq; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdQuMWsq"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7986e0553b0so55105447b3.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 16:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772582916; x=1773187716; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+C4qAhYyhZmC998gSNFlaGYNvO+FlBDCmTOWckGqixY=;
        b=gdQuMWsq/sf1/LGdsImsTmQ8bK4S12NWpib6EckHqoFP1D8ghx8NyfOPkcEP6pEh53
         kA5X/DwextY4OMv0LrfuOP/e3XJ1rBqGQjWKUtgh4Ja10mSCtZPADURlz15FubE537ow
         vCxbNS3G8l1ZNfA1S0rAV/CQoq8aZ//vbg6zHNdUvzCym5MSITsfkfXG/q0pKcGdWNJF
         CB9xZO9FZHKyVcCZZVpauaPKBhKG/BVUh6XkLdkhAoaa2+X+NnCoXuyRPUP6H5egOSSG
         KAKQue73fdZFRnXOFAC4e3dMp9a2nuVmyy0GhA/kzoZj0J3SUsp6r0EJh+LSxV37GpPA
         xabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582916; x=1773187716;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+C4qAhYyhZmC998gSNFlaGYNvO+FlBDCmTOWckGqixY=;
        b=pExdwNce6W5hbgFNvZ0RXLvpMZbrd4dRjtbACiDTORPkjcDz6c3Mta6B6nDZG4HDMp
         yheXm4qy7HA7SnnLN0LgQcdnfufwkGvxq6WRminqxCojAKcHEzJsTAFfUAj1AXjJ3Jkz
         EEH1zqkE1LrSLXO4F9D6Z16S6PB9Zeq3NyOdMCm3492Gnz+1YT1n799wMf6UUCSvXng7
         GQCxaxJt+MkkXhunP+6/Ch5Mn9EhwuTQGI1g9x69l1rYgRlV1vqlsGXCP9o5LeQPvjRP
         vtJG/MQ1qkTzM5UmCz1cuX7rS1f+hY2vBUO9l2CkyEdkbAwlDNvQpJdJ2uncvUJlt63P
         Z1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Rg6n16ZxKXDqLn5YX6z9G9xHtv+yNHf1rR1lGldh0TLQGQ5rDyh4yasU5Ydmu3mMBgLdAZi0+dVNJoDN@lists.linux.dev
X-Gm-Message-State: AOJu0YzUyQFf79UuIOQXlUmt79uAqdEagZ21n4mzTQgFAxN0m/5/39hw
	oL33MIcpeY7gF2rW0bFmoSKHCtpji9+y3DgQ2digGFyu98eRfP0uY1RD
X-Gm-Gg: ATEYQzyKTJcy8Li2hgqblMfTn12NcT6ZvTMA2g618jE7if6besbq5OUTjQDUEU8SZjw
	8HZl3/tvB3DkfNtvq4/HjxMuGbtaXTZxv01ZMRtxiJ0KHZWZ1zA7Jy8FthqyxOy7h+kcQ1fxKsb
	mTrDLapRc2YPA3cTzf6GbNryzeDjBfiolfWO+QcSTAlJDkgca9W8GN2KAvhTAunAB421/fh9pdV
	4VCgzbahTGu9gc0tuWFSPagE0ZgQ/WEFpQh5Nlb2museNfQPE+bIxbJE6d4Ywg/qL2sQn6tmWVw
	i7e33P0ArSzyFXF9iuQTLDLBUXoFH1B5k/lH98mP4rssSxDRB5iouhsDzY4oeyvcS4HitzzEksv
	1iG15ajCW2dasGUMI7jjHdmyUFhSPNH5QiIaH5ayuGmqyBZFshFYdygok+k2gZpkna6qCEGhu1r
	guzeKBew8Y7UFPNGlxKAwgTb85bHDRR8l6O/HmK2Fu3n0xVgd9gi/BePCSRmFd6jzOGEFAZnxK+
	juXUemZwZ4GQIYJM9KjmrapSMj7YNhZ
X-Received: by 2002:a05:690c:45c1:b0:798:980f:670e with SMTP id 00721157ae682-798c6cee6f5mr1913197b3.62.1772582915988;
        Tue, 03 Mar 2026 16:08:35 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bf9396sm68123627b3.34.2026.03.03.16.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 16:08:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 18:08:14 -0600
Message-Id: <DGTK703D49J8.39JNIJYNHU3FH@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Khushal Chitturi"
 <khushalchitturi@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@kernel.org>,
 =?utf-8?q?Rog=C3=A9rio_Fernandes_Pereira?= <rfp2005@gmail.com>, "Abraham
 Samuel Adekunle" <abrahamadekunle50@gmail.com>, "Artur Stupa"
 <arthur.stupa@gmail.com>, "Zhuoheng Li" <lizhuoheng@kylinos.cn>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove redundant blank lines
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Jose A. Perez de Azpillaga"
 <azpijr@gmail.com>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303173844.47975-1-azpijr@gmail.com>
 <20260303173844.47975-2-azpijr@gmail.com>
 <DGTHUZ568F1W.1OBYQ16QVDYLL@gmail.com>
In-Reply-To: <DGTHUZ568F1W.1OBYQ16QVDYLL@gmail.com>

On Tue Mar 3, 2026 at 4:18 PM CST, Ethan Tidmore wrote:
> On Tue Mar 3, 2026 at 11:38 AM CST, Jose A. Perez de Azpillaga wrote:
>> Remove multiple blank lines and unnecessary blank lines before closing
>> braces.
>>
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> ---

So, when you send v2 you can add my RB to the patches I gave the tag
too.

Thanks,

ET
