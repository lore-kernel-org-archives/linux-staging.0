Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AF2BCF45
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075871; cv=none; b=T/BUzI0YpnpMgqaAFfzqZz9bDYre9HgKAgSsjnbOrVQlAToBkyyQ5pyOZlNIIZl7K6OCGqFf3tgEu6ST9kNMokW9fnNlOeu9RZnCEuLODnf5LvqHvxUIC65U+UsVHksWUkJoLloYMpn/82Sy8cHcAtsipyQXVQ3Q9ctjuHN1cBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075871; c=relaxed/simple;
	bh=z9nJ0sOlnYXn5YlH531f0eW/xph274MZWJhFvvvZ4+Y=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fClStguCTsQQ5oCy73vPhiv6Z6NvzPIPfxHBfo9zbznVMDVH2fX4fWJJxGlzwDBK2atf4kyFOX9wv05NBni2t2Fnta64DbKZ7qboBnrw4LfiU1s+HCIFgHIEP1DTOgsms177Ldvv67tURJ8gosMXVgzj18sGu0je2AGDXoUGaWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmbTj8DJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmbTj8DJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso4880795e9.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075865; x=1773680665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9nJ0sOlnYXn5YlH531f0eW/xph274MZWJhFvvvZ4+Y=;
        b=SmbTj8DJGNwkM7cpr2a3PFpy6NBqVDapxk5sch7qCZMdRJb03YJD/vBS/a/ZZhyyfw
         FSE0Kz/zKUS14S2/j3QYwEjjsd4epSbIh4ymRRCOU0QV3MdppKNAvZtsJIb21P76jtSv
         w/TduPl1TlX6wZsuigL+x9sZ0Gh3FXxCaZpcYk4sCdBPvFN981HGjwApH6RKHt1c6ysB
         M72OeHG4xnFSlfNNcPIp/kNDy1GZGXjxW8neGha4Rb26mqRARFAfFGm+zure0bsHw8Qs
         jAIJjYMPlrqbwmwVHcqI+cPmRgn84FQj63ZTb+k+OyokoUeEGiU08gdcW9nBG1bH6uv3
         wZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075865; x=1773680665;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9nJ0sOlnYXn5YlH531f0eW/xph274MZWJhFvvvZ4+Y=;
        b=D4Wx2N0xWiWi4X4Sb68k9+NjKmVLhXeLN52U3sHH/epDLHVcwNGbsJi82/bQ/dCw2x
         yfyKQXbb+/QPl6MNztpUEmYtED4qq2kUCHWYrvSk7vCQnDtf2+/cE+i/uAJ9fLiHaQJE
         p66qHeXn353VPfZtggt3rusZgFGLCxuxMk8mZUbvOUy7gSryngQH+ZLfkrHx/3PSEOzw
         yQbp3iqVexSk2rCPxF9WXvwW070RZA8LLR2nHoxDRaJBUS0pZKdnhqxughkVBirehFUh
         hBCzi0tNqpI//GxuSg40BlBGNAkYHNuTj4SHJAwKkQbKljagA+1fPzbgNOQkObhLZEZb
         nEKA==
X-Gm-Message-State: AOJu0Yy+SQsj+HVQEx+ddmaHARXYL8+1KuWYSVTMNd6hH+0vKXj+haQo
	+hinY8Rxwm7d8GBjTMPYRtxXdCp6l2/ydwsr1/3uhVoQDLRMPBTb/c8+spOb5xD8I5nYIA==
X-Gm-Gg: ATEYQzwCOvNqE28NQ2iiyThO2jye6jAmjdgJNQpZ9Xs/amgGlmzgEsnPepbtPuxgr3O
	7kE9nuMnuLGKd6yReLXU1EbR5ZyukltsMoxumdyXyz+VVHNQBXYUnpY7+ZbZPnSHL4njtriWja5
	U62GMdBf6E4tzLCO9Oz2EvH7LhXqiEchBjx3KbNpUZ9cV3eHgsjcsoN4hR6j9rgSr5Hg+zf+NT2
	j/mhdlpb6GvprIcX1O+bMMkI7KbdImwrxHY0fqyaPX02YY2iCjmOVq95QrpfFuxYLw6kT+xkowp
	MWor6BrCNJXvDlrM+SOFnP97VcN/hh8gIvAll5HXVuZ7r1BBaAy8wWpb3AdFUKcYvPu6k3fOWNR
	LQlptFYEN/knXESx0ZK4YQv0xTT0Zy6UOODxvbWwfxpTogat+yDIc7QXsuv6DV+EL/bQnO5xaE0
	hTQ2ARyleJaXBZ0xqd
X-Received: by 2002:a05:600c:1e86:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-4852695b81cmr205469735e9.20.1773075864637;
        Mon, 09 Mar 2026 10:04:24 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm28300356f8f.15.2026.03.09.10.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:04:24 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:04:24 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <e65d636a-325c-41f4-978a-6c09a967a923@gmail.com>
In-Reply-To: <2026030928-smartly-spinster-ae05@gregkh>
References: <20260301005019.2510157-1-objecting@objecting.org> <2026030908-destitute-rely-9997@gregkh> <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com> <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com> <2026030952-petroleum-osmosis-50df@gregkh> <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com> <2026030928-smartly-spinster-ae05@gregkh>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <e65d636a-325c-41f4-978a-6c09a967a923@gmail.com>

9 Mar 2026 17:02:10 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

> On Mon, Mar 09, 2026 at 04:59:58PM +0000, Josh Law wrote:
>> 9 Mar 2026 16:57:19 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>>
>>> On Mon, Mar 09, 2026 at 04:14:47PM +0000, Josh Law wrote:
>>>> 9 Mar 2026 16:12:17 Josh Law <hlcj1234567@gmail.com>:
>>>>
>>>>> 9 Mar 2026 16:09:27 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>>>>>
>>>>>> =E2=80=A6
>>>>>
>>>>> I think I made V2s.
>>>>
>>>> Oh and also I made 10 V2 patches, come on.. atleast ONE is useful for =
you
>>>
>>> I have processed all pending staging patches now.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> You've NAKed all 10 of my patches....?
>
> You have had review comments on all patches sent that I can see, did I
> miss any?
>
> thanks,
>
> greg k-h

You missed about 10 of my V2s

V/R
