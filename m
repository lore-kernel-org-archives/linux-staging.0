Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966CE2066DE;
	Wed, 26 Aug 2026 06:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787724536; cv=none; b=Cn7Ev7pJnTR+3x+ggj0gsddCrpTnsVJbx8qP3Cs23l7SzeR8qKlD4N9zafyFpfBTyGPX3QHE2V5RapMXEJZ8BCGf8h1xmdBfUmip28AhZ+pbDhjI0Q+MOXwByNLq9xidgeZDVmjewiGuMg0SL5htpRpMutVH0R5s5mLoyuSTW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787724536; c=relaxed/simple;
	bh=aO42dyPevfcf6LTtRFpUHXwyOVgJEp0ttSCHcV/vxLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raedH53Uin94ClpjGP+1404bMMX+HpWbCU76caLXO6EuPiuBGdZ8uUVZjGMn4NdIUeoEYaZmAycaqHK/vad0+TYL6vlPahs/dGsM95dSuhl/Pwnsvw99ZEQpN5sIpxrsm/ai6Ru1NFXDRDNNkFNH7HJj2ZF9CXeiak26CaeS6o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rVUzUX7U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rVUzUX7U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00AA1F000E9;
	Wed, 26 Aug 2026 06:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787724535;
	bh=aO42dyPevfcf6LTtRFpUHXwyOVgJEp0ttSCHcV/vxLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rVUzUX7Un9zsMLT8MWv1M28VSHLv5B5XLBJsTKvnUQwf8PJRWF1MBLMlMFy4EMPkv
	 kRLLfmw9feiREXQAb4LB8L6QwR6vR/E+/Xn1Q78pVPcRJUN0d9ZTZZQzdrZ4UvDq+U
	 tSO43hnbMwTpZ2NS3J00hIKJKynvmV5iwig8RAXY=
Date: Wed, 26 Aug 2026 08:07:13 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: William Hutton <TheWilliamHutton@outlook.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch whitespace and
 indentation errors
Message-ID: <2026082630-union-width-1296@gregkh>
References: <MA4P292MB014947C54E25163A32A627F9C2AF2@MA4P292MB0149.ESPP292.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA4P292MB014947C54E25163A32A627F9C2AF2@MA4P292MB0149.ESPP292.PROD.OUTLOOK.COM>

On Tue, Aug 25, 2026 at 09:55:18PM +0000, William Hutton wrote:
> Hi Greg,
> This patch fixes checkpatch whitespace and indentation errors in the rtl8723bs staging driver.
> Thank you,
> William Hutton

Please take the "how to write your first kernel patch" tutorial at
kernenlnewbies.org, as the file you attached is not a valid patch at all
(hint, try applying it yourself.)

thanks,

greg k-h
