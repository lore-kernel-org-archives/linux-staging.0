Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161CA1F130B
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 23:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776726988; cv=none; b=uW0fPvEjrAJBKapA2UgirhGe2r06GxwQd3+rbTmOzGATTwgqLK/rbKRYGpp/rMjWuSqeYlNpkjypDNZiUA7yEip9VCliMtiCA0NPAvTYjyg66iIP9oZ2/58nGSlNgXA9Re5/OA8QYcaBMmEMjLOFd/34jGc4x4SIap7zvzIk4SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776726988; c=relaxed/simple;
	bh=B9qFZPu6gMxLIj/SwhGkVPoYLZcFIwMayN9CaHLscQw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=eaphPNwCQrB1VFH4Ksj4MHtJqc5zQnb+OKRQ2uXut2A7jcirruGj9tWwGIgBpcYNM4dKs+F19dBjSU33zQ9P9/+5xsiSk/zocwZlf9YbCVzTgGiziBk95CDGqguGwpwjGUJv3rslyBeuI4Ju4LmR/JDhrh9nXNF/0nvO/MjTAbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIGxhi0I; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIGxhi0I"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-651c7ddf514so3330963d50.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 16:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776726986; x=1777331786; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9qFZPu6gMxLIj/SwhGkVPoYLZcFIwMayN9CaHLscQw=;
        b=hIGxhi0ISzmjXKQNW+DjERvj5ekmUl3yUv/ETtliJ2CLHWdhJnpBZMY5yd+K2tDGHy
         AKkesSu3gYo/SrjW7maETLAbmWhZaXUm6FELEJ/ZrlP09szGDSf6D1aFMbMq8ES3nKlP
         y+F1vGk9LMSiLSQ7c8vxQ2qB8xYXfYrRQ80QLXNuXmj1HS6tLxe1Gwi5E7Kh1IOxenSB
         LrGDqFkrAI47wwgcQFL6KdtcDbknHn7mclJ939zoO/Azy7Ip2CUYZRfsu0/NAWgMCwcF
         2776/PBeHZLRRXARb9UrsfZr8Tktine37ws9j5ogwaKYHiV6g0Mn4DZbKL7wOCYgo+t0
         0CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776726986; x=1777331786;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9qFZPu6gMxLIj/SwhGkVPoYLZcFIwMayN9CaHLscQw=;
        b=DieBllal2JFoESeEPv/ho+i72QM3Pkvvf7VUfxxrLyeW4Axy0pPxR113MJ9Mzwje/m
         qe3dgeuQHYbDYxZjLU0TW5MvIp+TQuGXlCEeumibEQOx5HxMD2zM/GNqZoS9C5sg8UsP
         Xy47VEWAwGdkb0O8cDB3p0Upb9aHJdfYbz+AEvVuXfcwlg7eZE+r72C3RyEswPXCM7A+
         lnQUKET/CodRsiEIZ2bt+H92lPe7q+Di2Je3IPzHFSCZq+MAfdgS1xczO8sTmgzv1McK
         wK48ZR0mQgkc5M9XRtPvDKfIRZ4IcXu02V0Vxyq1E1eHJApxNszVJ8hpoOAy26jiVfzE
         +8UQ==
X-Gm-Message-State: AOJu0Yz53lkNt3xFJU0T2v20GXgO7CE5TIHO8ANJAzSbPGcGyyRnvNF7
	kYh+zz4xLFbWxG5Yrq7gfsjHEXTBJ52S0yPh1yhevM2fK1N3DnjhYEyo
X-Gm-Gg: AeBDieu9dDVhkBGHMRDN+A5pa0mTWABFifmh4q6JJsNW7UWdD5KFg6a9sC3IQV/6cqo
	FiTnVieqR3uebqLuUvKM+LefK2K9FCTZr3L6Y8A5dokKuBfZSurbBuWHmhzG7WXLexLUak0nZB6
	H5asfxc3YKIh7lCR9OQQepOMvqu+TYjQ8/hgEp0DRZPgI4qJ9Amk9MwA3ACuaGWazrU91TM8l68
	fySqwB4yJmd8vQTcpvJ/X25W+r/znV6VmhrhPuW2CCG29MBVEjic+DzBZuPA8GTwf2BsRJ5ml9U
	1IOEWWTqrQhy+7znhUW43rxUPUItdhOYl9drymIttvwTm/6OqpEcmVHju05qXo5RteEUSweXTJP
	sCM4IhLuQxE2R1UiNUlAD1dSdFmCe11vKIE+Ou67/dBeUi7m98REkQkqKRHtmhoJYQronm+9J+O
	QlcF8FBtFhFnzMIHW+XctUHaPtvj02BFOTSm8D82PbkyKGl82+oU39/twa4KUP4Ry//a3XzF0h0
	j/ddnbrsHF2lBGvbSQhXdi4qsc240H/jOc3+Eu7cMs=
X-Received: by 2002:a05:690e:d8f:b0:654:1934:3799 with SMTP id 956f58d0204a3-65419343ea7mr9632638d50.18.1776726985999;
        Mon, 20 Apr 2026 16:16:25 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314b25fa8sm5923425d50.1.2026.04.20.16.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 16:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 18:16:21 -0500
Message-Id: <DHYD5F7V8KDQ.3TYZ4U0E8LOJQ@gmail.com>
To: "Robertus Diawan Chris" <robertusdchris@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <skhan@linuxfoundation.org>, <me@brighamcampbell.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused offset in phase 2
 _BlockWrite()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420044651.164450-1-robertusdchris@gmail.com>
In-Reply-To: <20260420044651.164450-1-robertusdchris@gmail.com>

On Sun Apr 19, 2026 at 11:46 PM CDT, Robertus Diawan Chris wrote:
> Commit c1314fe4d28f ("staging: rtl8723bs: remove all RT_TRACE logs
> in hal/ and os_dep/") removed the unnecessary RT_TRACE logs in hal/
> and os_dep/ files, but left the variable "offset" in the Phase 2
> _BlockWrite() function unused, so delete it.
>
> This is reported by Coverity Scan with CID 1408950 as UNUSED_VALUE.
>
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
