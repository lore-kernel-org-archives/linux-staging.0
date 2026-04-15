Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B93DA7F6
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 15:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266660; cv=none; b=D/lYZPOyaacQJ54vb92jpvAY2cE39FBSLMTB+Sy+M3o8mABUs4S1akvBz1SLN+ofgRw11XI8l9cwjMQX4Eau9Pn9oPB+yhLQsuLUQEFV7nljt9gdAqxzQwOKPeuF3A2qv48FNMUUMEeqzSl9JqoMqu9I5+DoVfcoaHga10zj6vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266660; c=relaxed/simple;
	bh=vjc6ewOixUAkEFbKufZxohywyup7gceJzPn8Lf06IiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIqSMU4SbnHbNPXxNjXY4vK8PFmq/rhUb3c4WPuyhGHtdoUnyjBacPPZFLiOz1+ZUPOK6Dc3MAxhjoklOp+zuD7JqiRCJkNrExHJEYzKe1steJYMX2UIs0iGdh89cRzbYEYOw3hQ4SA1Mm0UEhGxz1UDu+5/EJkOWteQMwT7t9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ModkFtlL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ModkFtlL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b150559bso54574475e9.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776266655; x=1776871455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1sRBIoBJHuDYE6CTHJ4z2pA/y9OruR1tPFVV/uxkhD8=;
        b=ModkFtlLqrVHaEKoQK+d0er1cE+BP/4FfZRBwMRy4W/8QJxMun24ZIY/+OuMkNvJvq
         gxrIbRzqgX7vUJx9v7Uj6JdlE8wroRi13+JJTha+e2jkuWQhI9ty1uvuQQtcpOK3roOG
         bOvEhue/XRqYM/j9Lpq4osT0Nol3t5hQq7uBvmLFvOLpjZJR5IoBwFpeP/uan9cCNqJ6
         iCa9WRhxKJFSlrtj+GkERAyRHzJheQ8s9wpPemWxfBFgfeVJD4Bj7nBM6wCaNILNjlJb
         E9MRw31UcJqWWWKbjbcCeovbM7orm/mAM42bHjHOha/sC4HuJ7hTe+aeihBZDTk0WE/X
         EC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776266655; x=1776871455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sRBIoBJHuDYE6CTHJ4z2pA/y9OruR1tPFVV/uxkhD8=;
        b=Ie89ILp4qPcBVjJ1iRHM/YOqpfi2WnG+AB6tvYF37BET/gfduyhDKi6RAk4JuDxVm1
         b/+s6jJ0OGwWskvfHASRofw5VcZCG0mTsvWmRDiKVSmfcLZ7/udaq6X3inlwUHXVhLPy
         iTl1C6tLBkRGR/savUkTwIxOHW1KV3bVdCOyGMn5MK1FovqPoj+tF+kEdBKljIyPWyG3
         MSjALmbRUchmy0htuD19dEAnduZJC7YBLcvxJT2fXzKZCN4VZAVKFlAOtzNLRaFqtJ1S
         Rz9nfTiZ07gFVjIQlZvgpzlCfPlfbJjrNfFoCqhC39g95ifjBLgIw/I41BFwPog56d91
         ibbg==
X-Forwarded-Encrypted: i=1; AFNElJ+rHHxESy3O3fweLVy+FwL+XGW7L09dNzbsDxaZbl9BLTsTnUgBDVRVdcz7lHztcqZHYQWMw4uviowtgMxm@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn7mOlx0c0eQX2I9mNIvVzwqxetDH01yBrXTyE99zqIS2Kbypv
	BzM+xsBSUXWjhgTxYXvSQvHGXAyw/KWS5kN74JSy6emVObustxXTVwqz
X-Gm-Gg: AeBDievDbEd5MNZcyETdqpkTuh2FRjsTwN6l9i3/fH3xaSn2eijIxT2F9xTT3qn7Y4n
	HB7vRn8pjtvz0a7114iWe+zzvvQM2pzR6VS3usP+f6FrQrPaFZ0eeAX5R9zM8c0onYORNBQ02y9
	KGNMxmvnjInPzS3MQBtq2JwPsfVAFsYcF5W16qQ2ocVwGJD0Vag4ofbP7hICvyKAHE9vhEIl0Q8
	80XSeW2PJ5GhiNyQV9C+iWyTx0/Ni728cetPiZGID6jQaEYi9qHl4+dcHH+Ev0IiLl5ekzwqFSi
	lP9qMSuXGtpr1HrcAgauEPvE7NRx7UbahKegADY1K5mXlkuhvMxw2vjLmMSvVkbyr87VEl4I1sB
	U/ent8f6FGuTxUd6HFVY8AJID0pbqHGFCz3+656rQlFWgrUD9RllxNnq2m1KfCfcE5B6eRmPr4x
	GGMI40bXLDun44WzOqfQA=
X-Received: by 2002:a05:600c:820a:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488d688688fmr309421925e9.23.1776266655063;
        Wed, 15 Apr 2026 08:24:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f1dd87a6sm54988135e9.2.2026.04.15.08.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:24:14 -0700 (PDT)
Date: Wed, 15 Apr 2026 18:24:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, Ethan Tidmore <ethantidmore06@gmail.com>,
	Sam Daly <sam@samdaly.ie>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] staging: rtl8723bs: fix heap buffer overflow in
 recvframe_defrag()
Message-ID: <ad-tmii6T23d-kZT@stanley.mountain>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
 <20260405101548.124829-2-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405101548.124829-2-delenetchior1@gmail.com>

On Sun, Apr 05, 2026 at 11:15:44AM +0100, Delene Tchio Romuald wrote:
> In recvframe_defrag(), a memcpy() copies fragment data into the
> reassembly buffer before recvframe_put() validates that the buffer
> has sufficient space. If the total reassembled payload exceeds the
> receive buffer capacity, this results in a heap buffer overflow.
> 
> An attacker within WiFi radio range can exploit this by sending
> crafted 802.11 fragmented frames. No authentication is required.
> 
> Add a bounds check before the memcpy() to verify that the fragment
> payload fits within the remaining buffer space, using the same error
> handling pattern already present in the function.
> 
> Found by reviewing memory operations in the driver and tracing
> buffer pointer manipulation through rtw_recv.h inline helpers.
> Not tested on hardware.
> 
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v3:
>  - Rebased on staging-next
>  - Sent as numbered series with proper Cc from get_maintainer.pl
> v2:
>  - Rebased on staging-next (v1 was based on v7.0-rc6 and did not apply)
>  - Removed Cc: stable (will be added by maintainer)

Wait, what?  That used to be a thing in net, I don't know if it still is
a rule there but so far as I know, it's not a rule in staging.

I made checkpatch complain if you CC stable but you don't have a Fixes
tag.  Could that be what you're talking about?  A bunch of people have
asked for Fixes tags on these patches as well.  Please, do that?  :P

> 
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index f78194d508dfc..717e0594d983a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1132,7 +1132,13 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
>  		/* append  to first fragment frame's tail (if privacy frame, pull the ICV) */
>  		recvframe_pull_tail(prframe, pfhdr->attrib.icv_len);

There is no error checking on these pull calls.  They're supposed
to return NULL if pfhdr->attrib.icv_len is too big.  (There is a similar
caller earlier on the line before).

>  
> -		/* memcpy */
> +		/* Verify the receiving buffer has enough space for the fragment */
> +		if (pnfhdr->len > (uint)(pfhdr->rx_end - pfhdr->rx_tail)) {

Remove the unnecessary cast.

Otherwise it looks good to me.

regards,
dan carpenter

> +			rtw_free_recvframe(prframe, pfree_recv_queue);
> +			rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
> +			return NULL;
> +		}
> +
>  		memcpy(pfhdr->rx_tail, pnfhdr->rx_data, pnfhdr->len);
>  
>  		recvframe_put(prframe, pnfhdr->len);
> -- 
> 2.43.0
> 
