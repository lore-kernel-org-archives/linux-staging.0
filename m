Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061083;
	b=zg1FZcH+tCLwEdyHyMjsqdq7t5sbaHlxBpvvx8+vZs+YyJK+FSM4IaPNvFMt+lBgNdiY
	 L287+Vi3afDwTG+CmtDI0+JRWpKoZyBv0RIaJGARWk8Thg7DUrOMGSWoZTYGiNUTHu4Lj
	 lgdiNEIPRkSr52hvmjlqYTzgz8xuanWx99fqDCwNWbaWbdtDmP+XVlis1u0iXD7dSLq4a
	 5Z2ShrH0BnBnRMvNfujsYL6hl2GM3s6jqs0fGX2eqbG/ePYdsdL2MkNCCNycq71ENS0Ux
	 hUtXPx7Sc6k0GFCz4Xr3YWMty1xZTcHMZtrQ2iaahjM4cMqiJRu6RkBFyoe+7Y5T4uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
	b=4qhBeJLubTkuoc1Cp0x/E8xQ2/h+7GwJ38gwTcsFN1a4yn4i6U/O8fXpE/unvxQK0+zT
	 fjQGxaN+eLfu2tkfDaIzR2KlIyoRZGB1S8A+1ZUo5iOxQHJgAkyKW4Ps7vTWmeAqwKFyU
	 lx0qfHkx3pEE4TU8T/tAh87P24WXIiqFeDEo/HFkydvUhPwGfbiof92I/OOQxQt1iHTqC
	 I+CWRX8KmRB+OrqJAHhmpqfpOHGDibfePQRgR375lgzAUVL5pwqJ+ttRlRzET308Awtl0
	 mCS6/EZUKf1o0jvl8TcXaUcXlnswdShiSMwCJ1wXcv34DElEqecGOhBsLcAIFYpjLXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afxuE3Tr;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6B9606D819
	for <linux-staging@lists.linux.dev>; Sat,  7 Nov 2026 14:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB6B9606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afxuE3Tr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so3547870eec.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Nov 2026 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061082; x=1794665882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
        b=afxuE3TrQi96wVrH7pYPEGxCdOESSaqOuhcqq4QpD2KfShfAxfYnS6WDl/T/NaL5QD
         qVk27arTlt8GV0uvGK5Rx4kt+x7MtUcuLhyhDdZAEi6JyCdDvC6gWyiJbyBS0cC7FA9M
         Y/kvJDCMNDKkpiuWWu443FeGPHhFizOG6a03OOikE10oCw+eTf33NoLF21ausDpZ8605
         xPlKG9niqGEf1pkRuZ+nj8EK05ch97KDUjDy/DvNd8qfdEvhRqB9PKRMCtgHbL5JU+IO
         A/Zx6Atn8GJQIRODJQFPamRM3k2MF3pD2MURdBxUjPNPpfPcrjQRp+VeVMF75C3Fykz9
         4suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061082; x=1794665882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
        b=PHBKth3LJxhh+bjJ3Ju1FsZZXafvxldDV1+u5Xcxi8MRpCgA1CCzTsKMtqXdEW45mT
         i6mtvbygFViA3bEMUOKzzPEIywjjjSEfaLzuacBwvc2qg/6VfZhGUUid0l89kM1nRWMe
         WjjW8rLN9/zXG4gcnmpLZiyHN3hfnNMAIT+JXc6Lr7QRTByRafyysnDlk8bG6VPeMHh6
         Ij20ERsHYkuHio4qrQ2HpZjHRUquzhR4x5SltDNgw68hLv+EQPAobqISgJiEc+l2CGD2
         d6n1JWf8TzL/boStnYouj2OmgAlvFe1CLAUzkcXdtz/P5c7yvW85QhyEQEeyQa36nICs
         0USQ==
X-Forwarded-Encrypted: i=1; AL+hErHzfZktloKZCb4krMPUGQiYLldw2XHl10rwSdqurZ6n+yXBGOveYZqgcjFYSTEKRPr0e14RU2BF1ecZUFdt@lists.linux.dev
X-Gm-Message-State: APuU4Z8S1VtDPDrGQvlkXPCKdU41t5GJoMNMSx5BfsGijWrp12HiXsQH
	vhctoPqShvhZujNIw9f6bUrIiK9EyTuJ2XXFbdEYPUNqN5xK6S2FDPAp
X-Gm-Gg: AYBFou3TWhDdFwbmCiRTDxtOmO/JV30dmZE0UprxIBf8J3xOJJrfHs/zq2bKOULNo/k
	URKykkPcVm/0qscb55MPMKKcDbovxK0xuWpNRgBL1LcpCxPjBksJKjnF7MRexcKfAKFNMdQ6ASd
	eu6kQsgMTr8u6Z+2uiYhWqoiM7+rzTzVHGbNe7PKqM1XR1Axs+sGlBQ/JDgHfmg/r1ZzauNr2IL
	B2ryRFxD12dqI8qV6f7qTe3MPiNhN5lcrkl4exQGoO7MGichqmM9BcKk/8UiAYksGku0Fot85tb
	3HeGWnNBPBa5S6zaOFiE2mS/DI6Y0S5Ut2+QwwWHc5Vz44jKZBRNXgOhag5T48OzpCsFYB+Sn3H
	eJ+EYbqE+VsePcDxnfCnWd8vWBSULjsh+Ao0eM/YiAHuIgu+n1Wf6jetCGLx4xb//yLT2En27zl
	j04X3YmeubfH9OepG8EvgVVLBy0o1ylnqGmuzJhXICKCpKJr0W7dkdhmwsP/+5JCVVPz8dTvuCk
	vCcLCR5LvS3H3pMaBq4Gxe6A8nkzc67CLhF176IsX0bVoGo9AI1d9YzMJPhh4I6wNgGmBsicEHz
	7k2K6P6Z0ddjV1mfQgomMzd+qCFiYJMfngcALqINlg7OO18OENZbrHc45sA=
X-Received: by 2002:a05:693c:87c7:10b0:36f:26a7:968e with SMTP id 5a478bee46e88-36f770062cfmr7560876eec.40.1794061081678;
        Sat, 07 Nov 2026 06:18:01 -0800 (PST)
Received: from TheRealOne ([2409:40e1:407:758:265f:d54e:2491:df90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm16251949eec.18.2026.11.07.06.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:18:00 -0800 (PST)
Date: Sat, 7 Nov 2026 19:47:51 +0530
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>, 
	elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in
 gb_svc_request_handler
Message-ID: <au8s1_tIBa0mpTSL@TheRealOne>
References: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
 <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org>

On Thu, Nov 05, 2026 at 08:08:01AM -0600, Alex Elder wrote:
> Here is what I see happening at the beginning of gb_connection_recv():
> - If the connection is disabled or offloaded, return immediately
> - If the size of the buffer (passed in as the "size" argument) is less
>   than the size of an operation message header, return
> - If the 16-bit size embedded in the message header is less than the
>   size of the buffer, return
> 
> In other words, after these checks, we know:
> 
>   sizeof(header) <= buffer size (size)       AND
>   buffer size (size) <= size encoded in the header (msg_size)
No, it does not verify this, it verify:
	size encoded in the header <= size (buffer size)
> 
> Therefore (transitive property), this is true:
> 
>   sizeof(header) <= size encoded in the header (msg_size)
So, the transitive property is not true.

I have sent a patch for this bug which verify the msg_size and header
separately, which fixes the out of bounds read.
patch link: https://lore.kernel.org/all/20261106094303.55158-1-chandradhar.2003@gmail.com/

Hey please review the patch if there is something wrong or there are any
other way to fix the bug.

Thanks.
> 
> And it's not possible after these checks for this to be true:
> 
>     header.size < sizeof(struct gb_operation_msg_hdr)
> 
> or put another way:
> 
>     msg_size < sizeof(header)        cannot hold
> 
> 
> It surprises me this would be missed in the AI summary--and I
> fear I'm mistaken.  If I'm missing something or wrong about this,
> please feel free to say so.
> 
> 					-Alex
