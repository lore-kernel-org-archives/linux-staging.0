Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADB411F93
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766291; cv=none; b=IhCjixXZT4kuXgdIxpR+E0DTz9pvH3IfwG+BxyBsS/SvnaeFXdinQ2xo0j+WUD5Dg9tgtfhZzWc5SCTjTUuNXxXb08hYY1BweZ6uYUSx9YmmJVVT/G00n8ay9j7RXXchqdqULPZG4Ei/6w3X9yDIVD+kU8jS5pfsmeXtvP79BE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766291; c=relaxed/simple;
	bh=XfnvZ+tGyvOEX04e8DPs3Qx6yRkrqyInvUwTUbYGHgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFeny7UYKz/8WOAtOkXe5NcHTCXPV2sfA9/2CY82hf3dT5hcAyECY0ISVUnMl9g2u12lTsWdmNYs83u7VxXNK7LwTgbiuEQVbvPb1ZS9lo+djYyN0PjSP2WDEEUzwM5X5rd0KKI569dsUrzAEhMn4yHQWxffKYkFlHmM+6FTkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggoIZ5zl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggoIZ5zl"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a2e9851ed7so30368681fa.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 00:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788766286; x=1789371086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEX1aCK9nP42qtFnudljLMoJtVeAMHoRCznJunAcW28=;
        b=ggoIZ5zlWLAtubRdDjUauKiTvExD02sLTicD+d+ZNadl1sgYHmHZiccd3LRYNyKlLo
         dQegl7zkCThA7a7VgbCqexmMjJZDrTr2LSYHP0Ntzi3o2XTWtPQQJsEl+djKaQXTdlqH
         YPnl88wgFeUds0htCfi2fSDFA5DPSOx+ipsgjmzff8MzoMw8BKY9l7tkLTmLbsUvsBx/
         1SCjDKAHx8CfdXeilrna8u/OhqhzBN6l7zHgt45oPWB67Usm3btkM8iXlt9Gd5i1mAt3
         LnhvbfaZIGiDXP+Q9wjmrNVeM4oE4xX9dBs35H60pmCIShLq2jKZmLALk41gRh/VZg8e
         ajPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766286; x=1789371086;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEX1aCK9nP42qtFnudljLMoJtVeAMHoRCznJunAcW28=;
        b=L6LOHUzDsEkYyMyVu0wV7LfrV/4lKpg/VdXzv6oJrZU6zqPfuaer5QD5fidmE7o9/p
         JpjjTB3qnhJD5o+PFpKZHGF1YociyfX1IyA7Xjec5GKsoNaNCZxvosua9gWYXQXnhdwH
         FPHBboUPYpOyAjPRhUc9gsPGZPFgJ7KHOrAU05aPWhmBSo9sPxqlML57ETrKLYygGJhs
         Fl/AoauwzWXYC6yHxYD/rrsDot/dsW2RB/NDUFBjtrxtmfppias8W0RGqdyBVbRLPV9y
         fj/K8/9RCxUh+dyRzarmyy3/of2mphhpSrRsEGrTKr7cvyZBBSnRYE0EVZeLoc/nRBz+
         pPtA==
X-Forwarded-Encrypted: i=1; AKwUvBwMtUgqNg3yicUbsg7/HBF34f+DY/VrZcHB3nZQRVCnNbtImEa6pz7XFthSz6Ul/MNcEGyXqkf0jTdV4xIG@lists.linux.dev
X-Gm-Message-State: AFuF++m7lNopRJqEa4lGNfNXBH2XjdQBQP1zHCe+ED6DMUcCgOW3iJis
	SRIv6GRZnO3y/LwNEGPNCQAsOup56LJxqzARhsiRqSmYQq6iTHBQQUMzAkgsFg==
X-Gm-Gg: AYBFou0YScJ8qbo5FKFVWeXpu9jMjVTz+PV4+o2Hr5vESkFiS7US4KBHQ+BDS2kB97k
	Zblw2GTCqy7sTIes2c3EMp7haWbPjKx2232KpWdZ1f1I0AJvuXVR/MVjAVB2V0OSW1iadXap7b1
	2vb4d8lp4PVx6mfuG5CCtqTktuqlHPb1+xDoOzOZmhUxqXk5g3zLy1kTA2Uryk5GA+XNNuABRfa
	uFBKppbaKomY/6opuVLU7Xev1Ms9vFHsN4x7IjK3yqUnQZ2OarZV7rsiZGQWPLZPc7TeTUrqywn
	A8f5Y5pCHquptTWWaPQQxp9Nz/Nb+SE9Ytx9aQobDBObpMSB6s4+kAZr2E0YGtFlhjjYlPwkbqn
	kRKl9vZXgyI35xmN49xF1pMDgrxsJPV3++bPCgmfrVC8bdJV1nts+v/6KGFovDju940P1uLcYrq
	suCAL5GSsKo7F5MY0LIGvVxgKGCiR2+jxyOSv4faz20Dhigan7EDzpwgyygZE=
X-Received: by 2002:a05:651c:3049:b0:3a3:a3:3560 with SMTP id 38308e7fff4ca-3a371b2e558mr23880441fa.6.1788766286141;
        Mon, 07 Sep 2026 00:31:26 -0700 (PDT)
Received: from archlinux ([94.229.17.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37059aa61sm27035991fa.27.2026.09.07.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:31:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:31:22 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Gabriel Windlin <gawindlin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unneeded else after return in
 enqueue_reorder_recvframe()
Message-ID: <ap5oSuo4v9ZZaHeY@archlinux>
References: <20260906233552.971860-1-gawindlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906233552.971860-1-gawindlin@gmail.com>

On Mon, Sep 07, 2026 at 01:35:43AM +0200, Gabriel Windlin wrote:
> In enqueue_reorder_recvframe(), checkpatch warns that 'else is not
> generally useful after a break or return'. The duplicate packet check
> returns false, making the following else on break redundant.
> 
> Simplify the loop control flow by using continue when advancing the
> list and eliminating the unneeded else statement.
> 
> Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 7568fc514d7c..498c7273f273 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1782,14 +1782,15 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  		pnextrframe = (union recv_frame *)plist;
>  		pnextattrib = &pnextrframe->u.hdr.attrib;
>  
> -		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
> +		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num)) {
>  			plist = get_next(plist);
> -		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
> -			/* Duplicate entry is found!! Do not insert current entry. */
> -			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
> +			continue;
> +		}
> +
> +		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
>  			return false;
> -		else
> -			break;
> +
> +		break;
>  	}

Hi,

there is already a similar patch in the lore:
https://lore.kernel.org/linux-staging/20260820162601.74952-1-myeonghyeon.park@gmail.com/T/
