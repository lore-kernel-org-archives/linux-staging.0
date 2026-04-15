Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85303BD237
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261427; cv=none; b=BDZ0NQohjcjz35Jgrbq19W1CBeMuJYOm8cILj2ruN2y+rgzZVPINmE1UtET+0F7o2E5wDL2hKm9XZl7qSjwOSZEOgTOhkteE5ur9fgVSsdxK0K3QqFtDv+UgHbAOMyCIPEW+baburrrIkveMq+7hXOIk8KHCn+6+yzrSxvcdU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261427; c=relaxed/simple;
	bh=l1lcdvZHs2JIpmEuWUVWoN1wwTwH0XafIGwAwZ6eXzc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=uFIaKwS37x2cat9gtVF0+TImK7fqOddncxn0D1xaq7CY2tc9mBD3qeq0Smyk/TiV7kcOtmac8ekN5xCfxZFOa5G1DEAJ9evNGAxp2Q1ALargt8f+JJDkk2yOeNWID2rjy6mwVVrn3YKLcu5W/lHzccDvS5DD/Q1ImYx9HRmc3uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RWRuD1aK; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RWRuD1aK"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776261422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QY9Gw8ydzbuszN+p1zfLBzLxl6TAlHCEwzfldMAllk=;
	b=RWRuD1aKiz7VO6UYiHXET+M8WGaVwHIbZpUEy5ZdXEEZu17Lzgf5M3NLljOvG7DyVQQ/sQ
	nLPD7GNiDG7WYjryrnVrP/svXZCoyEh5KCNPwm5vKQZVqLU5meoHfHnxornrgGm1488/NT
	WdkOAKrVm1+ZJ9X3MSkOWZ8IzWbwMGY=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:56:44 +0200
Message-Id: <DHTS483VGY68.2WFIJPWPCVXB5@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Delene Tchio Romuald" <delenetchior1@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Sam Daly" <sam@samdaly.ie>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] staging: rtl8723bs: fix heap buffer overflow in
 recvframe_defrag()
References: <20260405101548.124829-1-delenetchior1@gmail.com>
 <20260405101548.124829-2-delenetchior1@gmail.com>
In-Reply-To: <20260405101548.124829-2-delenetchior1@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun Apr 5, 2026 at 12:15 PM CEST, Delene Tchio Romuald wrote:
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
>
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/=
rtl8723bs/core/rtw_recv.c
> index f78194d508dfc..717e0594d983a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1132,7 +1132,13 @@ static union recv_frame *recvframe_defrag(struct a=
dapter *adapter,
>  		/* append  to first fragment frame's tail (if privacy frame, pull the =
ICV) */
>  		recvframe_pull_tail(prframe, pfhdr->attrib.icv_len);
> =20
> -		/* memcpy */
> +		/* Verify the receiving buffer has enough space for the fragment */
> +		if (pnfhdr->len > (uint)(pfhdr->rx_end - pfhdr->rx_tail)) {
> +			rtw_free_recvframe(prframe, pfree_recv_queue);
> +			rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
> +			return NULL;
> +		}
> +
>  		memcpy(pfhdr->rx_tail, pnfhdr->rx_data, pnfhdr->len);
> =20
>  		recvframe_put(prframe, pnfhdr->len);

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
