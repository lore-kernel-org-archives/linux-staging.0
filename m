Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E01E7C03
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 01:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775007582; cv=none; b=DAJO5OxTWj8LHzcfco+39tC748eqmpnZXTS4LJBQIAKbtLqVMQ7vXPtuBUgzv4SdV4gI/WyxczRK9vwdlSFO5S8giK4yEGm2doOx6LJa5c4JjBcGEKLI2bzSnSZA+Bu+Oc+7SE+PaWgz5qIb8ZlxRFRcaDk782frHGvXOh67JFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775007582; c=relaxed/simple;
	bh=wY7o7r3OL0s9NKeW8Q5rSsh+WFxHAm7fLAHRRCYENEY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=S1CNWUWynvU1eBG6Zn/c+kty3TfP3ZZFGmBYhwdrw3pbWCW3pCmp4BzRJzKsI8Ek9CpTYWLPMOl2UoqPWjPNwvX3cK77juSQPyN1okGy5ks7U1JSUGfP+Im+ADJJzITpeZG2tuo2RHSwEU9pfpuGpUJDyBG3Du1IaEb7bMVKNvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=me7hnNvc; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="me7hnNvc"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-650152687c8so6515269d50.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 18:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775007580; x=1775612380; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNhr2SdKt8gQelI59+HRm5gtphE2MU9kTl80bBWwfZ0=;
        b=me7hnNvcDhgz5Wzcm4mZvjlWJCREsSdumhagJF3wEu3nXB3N2waOxD4BnwJyoSZNUW
         agrMWuAhJDMjoVRQFVjxJ7kxX/xM5k70Tm12ebiuamsebpkP1KxqYPP5w7eoQU46/iUg
         JaCxHtVYlmkNsUSx4mXNUg48kKb+FVthi927ojOrkY7NO31jOIhQauKleBV8pTK9X2Qw
         lbpmzJ8k7dy8NBxU2mK32yTOsPgUD+z93VbJWA1u/UVShzvNmhuEXVUSmhwScFWIs3oJ
         xGEL6/Am15fi8keVPJZur/+hpiUQ3FhwIGKFsktL/ves2r3zxNf+BUnRF1aji4Byqngr
         Wq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775007580; x=1775612380;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNhr2SdKt8gQelI59+HRm5gtphE2MU9kTl80bBWwfZ0=;
        b=Qhaj7dPY4v1VGtCZj2G6gCbxtnCyuXUaaOlxXVKUUdIz7xWOtvD3MER/nV3XkyzlBK
         xvNxW7/e1dRldWPhQocGazwU/rFVoRpLrEwBBFoNY+ElKEujaABwfA4BtkzaYdYhqEgK
         IxresqoYNv6OFA9N0ctwyiLilOS/b2wbka9ozVjylrLIJeqFt1n8QS1u5GNAIZhRNkqs
         4evL4inA0V+dIP7bpJSevGebwfW4Io+MvX71eSrgBdrxGbQjhIj7KR800M2WlOQybwq1
         lUG4jsaLfjBi3iDhoA4CyMtXsJ2UOZer/5TWv3NH3iY82m1oyeNO5QrjT37DF1bOFhJK
         3TfQ==
X-Gm-Message-State: AOJu0Yzs3yrcWZV28IKZ8QBXhptefAqjr43vfCIXlRHwNaUho90M9/hz
	I22vxjXytplB+0yV2E08Cr/jhMzjc60BOO1PPq9f6qemrBzmJS4qLf6J
X-Gm-Gg: ATEYQzwguQFTJjjsCpy/7T6gKetabu/WzCTAq/qP+a470D90Q9qM3XGGXVi2ZAwy8Sp
	XVidFN9XNOBMBNZQZ44eoiIBs0Ym391w+rcSsT04LMa/W3meuQRSDKLWcYLcGwCV6HgDyl88Miy
	bUt7LKU34MIhrh65OFV+8ZqoWXeTgAciU2jwhfKQ8BTKc8MT2wJjlW4SiBUO2JM8Th7KNtgt2kt
	S+WhO9VMRfYyk/HrcqUYVETfDOxA2rVzvdgMi7XdrIWOcy8KSui4u6w7HjLcYXcqdrewBIuVnpU
	/qlcrOOjU+ANByDXAwSqZ3DiyvVOVNRq48hOJ1RHbT782TIZVW7vebESdvWVViuCmamZGzzzdN0
	ZSbewqAcqdjnvEyRFyGiUqxuQiFNDbltyBQ8cOZ7whL0Mt9JrVnK/ujZhkrbdFmEi5SHUasRuEx
	SAH+08CY0ZSC2lttgG1FuZLrnaPF5ZsiVqJOaHKk+QbQ3Iz59MX9vcVHc42iVYWDsh6UPsYiA89
	R0qWCXng9uuQG896kTnpfVbPA63IO+S
X-Received: by 2002:a05:690c:7690:b0:79b:73dc:d30b with SMTP id 00721157ae682-7a20f8f01ebmr16223207b3.8.1775007580421;
        Tue, 31 Mar 2026 18:39:40 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cb7135d8asm57113717b3.4.2026.03.31.18.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 18:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 20:39:35 -0500
Message-Id: <DHHFO6YR51PS.2UWT7ZUCRIJFV@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] rename/remove functions and code style cleanup
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331155318.185117-1-linus.probert@gmail.com>
In-Reply-To: <20260331155318.185117-1-linus.probert@gmail.com>

On Tue Mar 31, 2026 at 10:53 AM CDT, Linus Probert wrote:
> Thanks for the feedback on my last patch. I have adapted the following:
>
> - Split each global function rename into their own patch. (1 - 5)
> - Placed the removed functions in their own patch. (6)
> - Created one additional patch for removal of a "space before tab"
>   warning. (7)
>
> Br,
> Linus
>
> Linus Probert (7):
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: remove unused global functions
>   staging: rtl8723bs: remove space before tab
>
>  drivers/staging/rtl8723bs/core/rtw_efuse.c    | 22 ++++++-------
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 +++++++++++--------
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
>  4 files changed, 37 insertions(+), 34 deletions(-)

Please add "staging: rtl8723bs" to your cover letter header. I have a
filter for rtl8723bs and not getting your cover letter was very confusing.

You don't have to resend the series for this reason however.

Thanks,=20

ET
