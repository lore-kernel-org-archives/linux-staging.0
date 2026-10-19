Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C033B97D
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 01:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374712; cv=none; b=Ccus46F0AxlMMNaVdVjFdcZxo074vi+v+pbmSzcN1wQw2p/aigaMy6TJMFNvCiRbMDeWRySwIdGTnpDpgmZevA57IKgPJePAX9IulYOwDiqLLWjQdAYaAPZ3iCXufQKu/RR9hrHdP14ruUdjzeVDWhR7ZIgw3SywhNuy2PdAJxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374712; c=relaxed/simple;
	bh=STCPiFVncmd0trs86+Lefpabg7jITOU//ioTqNGMZE4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jhhohCvSdvptjRcG/i9idXPnpYrLCNbXSQgeXChFFTRFQF0gADt/evA0UvBghiACTWzjyEVsFL+h7h+Pod971LVlLo4D6NyWDoIFW/OT1rzt0LyVV4zCJAdC5WNjN+X3rgP09FRfTqXTReVL8aL1aOH/gLvMdJSZNw3QUvkGqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wo7dmaLA; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo7dmaLA"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a2297c55so1045097d50.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 18:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792374710; x=1792979510; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=STCPiFVncmd0trs86+Lefpabg7jITOU//ioTqNGMZE4=;
        b=Wo7dmaLAVsh8TQ70P74lvQUdyPpuAqsDzFAiMLsff1lPjsKMlMt4NPPEKB0ZodPvQ8
         RCZvOAm2OdSR7IdSc6Se1DMgW9GElx9G2NiPIUuDCZboSBY0FXKRSvrjKVlWxf7xlLfO
         WoMNeSAT725/QKqcO2G5NzK3bjl5q1s1WbiV2KBuWtfm99B/hvMt/+pT3fety721GuSj
         1tdExZtSgKXvX4tBwni1ZOciJ5+1QOeoEjkCiTI9/CNyjqk9pwX9pnpSgRmyF6Sj9pYS
         e3rymFuaV7dbBm/0F/19ZWsIe2aADBPqSTkGJ+HqkY1VV51F8hzBDMWF6/sbQ3c5wRcF
         wwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792374710; x=1792979510;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STCPiFVncmd0trs86+Lefpabg7jITOU//ioTqNGMZE4=;
        b=jh1xjsJh70Aavj1vnn3PHPFTPW6jy79sIUtZIKUedhUReRqH+GvsUI7CFASsTxzY0Q
         nLGsWQAL68b5KfSx3wdRnWNn+IiD/oiXe+5f5QLa9Thn2kE5veSAsdF3W6nyQTSevQbk
         B2VVmJfc0YTTbYkUgzuI8JWBKHRrzNDx/ZpnKAXSymfzpoYSd8H3INhev138dvcrDOzU
         Ytmkjhuk5KyaoKndBLZfbaj1S28E6lLdyZoqKBy0u265/323ISCIr0S6KJ4SvMrDyAnW
         XOTuceBgBg4aeBqTtraRRDr06BwA4VwNwyj7ws7Wt+/2w+c/IHdly2zaKV4Q9ST8PIAO
         88zw==
X-Forwarded-Encrypted: i=1; AKwUvBwhG9LUF2JPHOag+7IwxDAPvb3xGqC3f/nrT9KihurrRAgBg29uylU6sFzMCAaIMX+vttJkHkB6/lrkh+rr@lists.linux.dev
X-Gm-Message-State: AFq9FYLo7RkNOntpQy4j3Mr9mSc+XQCKepquObuCYgIBLGrBI0jPJqpa
	PyKYmRH2VxR4GMKQTEXxpkiEOm9/HaTEY6E49VLr8oro84K2jqDvfNx4
X-Gm-Gg: AYBFou1Y2CnOFeOdNzOjQGYi1sVmdMQUwhiMWG//f03jifrTwyP29zvv5EZx0QmYgbB
	tdeRp7iPGk6eiQ6OUkzWRDdmrzD7YoRMUd+SYdPhrrwBBWPZUKK9h4wWiApYqX2atRiKGoedhSW
	vGrMS27y57cTs9tYMpDr8k8Jjen3dU+TYS5z/wvx+PEC6BrLSwH9u9hlPPhoL5afHuq2/jUNHIh
	Dvmy7lQdzP4UDCe1YWr609JgiYwEJEIXgVzRtL5+3JR0Ngd6h+JGmf/URwRSNcgZLt3ZiHub3iW
	d1HUQHl2B4qNPTGJjdwZinF2pPgEhTEleWCf04EohpzaQXGaRhvWPuZQ7pCjLIqSalTUzkn8ff8
	wBfKkK/HiFuG/Ze1ilB+wU/+6uZV//ehUfvAxk6ZRmyN0a3CE64wqXy5HK6ws6L6N6cW2t5tXzq
	y2a6gtraBrJ89b0rtI8oklLOJ08D+UgTowPtUMumdgbu+UHQaU7yyikFtsM+TmKWWyrD7Zet2Pa
	O4yyjLYftguOBxuoMyWG4tk2F5yA/Og9b1QYYm29IPOaPrpjmtAC+v8jjZI48GrgYw1L0KRpCks
	Xo0=
X-Received: by 2002:a05:690e:14c5:b0:675:1102:ffa5 with SMTP id 956f58d0204a3-679ca4d4299mr2263242d50.3.1792374710494;
        Sun, 18 Oct 2026 18:51:50 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58dfb98sm35645197b3.24.2026.10.18.18.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 18:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 20:51:13 -0500
Message-Id: <DM8FSLOD0H92.5QQ7U2N7KDZE@gmail.com>
To: "Okhuomon Ajayi" <okhuomonajayi54@gmail.com>,
 <outreachy@lists.linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: octeon: remove unused cvm_oct_transmit_qos
 declaration
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018231538.74139-1-okhuomonajayi54@gmail.com>
In-Reply-To: <20261018231538.74139-1-okhuomonajayi54@gmail.com>

On Sun Oct 18, 2026 at 6:15 PM CDT, Okhuomon Ajayi wrote:
> The cvm_oct_transmit_qos() function was removed by commit
> 6568a2343639 ("Staging: Octeon Ethernet: Remove unused code."),
> but its declaration in ethernet-tx.h was left behind.
>
> Remove the unused declaration.
>
> Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
> ---

LGTM.

However, please wait atleast 24 hours in between submitting patches so
the mailing list doesn't get cluttered, thanks.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,
ET
