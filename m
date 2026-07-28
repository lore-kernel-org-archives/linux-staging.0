Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1174A224AF9;
	Tue, 28 Jul 2026 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223370; cv=none; b=nU1kIN1Lao0WyGVy+oCAo/MnaipzY7+fDbthHlt1KmaNBqVN1/vxJzLZKChUmCDzhHT8uwAaRYqLqorqtg1GTn5nFobJXVHg5aogWvFqEYnaD7vPs79qwalO3LSD/z/+6NQDg9dUkGb1bT9gnXha6fwOuQS2FbUI1XBD+f79HU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223370; c=relaxed/simple;
	bh=mUEVlkrtenwP21gzQHgWOpMup0dXOSoReqduiDqZ3/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRr7DB88ev7I3v1Hryu6z7XTvuUzpqnmLJxEhWwykcwcV6gyFt4ESjc5r3blKeDsNMyCICQK9XjczttSmoVeo7/7aphd/jMV2n5g5Trn+W4PgiY6XDpD16w6bqmUpBJjWVC2AcnCILgQNBfrrV43glyKHn6Ua2UU3V8u33/EXcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z0XcabsE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z0XcabsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575C31F000E9;
	Tue, 28 Jul 2026 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223368;
	bh=D+ohHTvQGv0WUIux/LlQ+xsAVhG5Ljzz0Jf9Acacep8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z0XcabsEP93H3DG1M7k0vOqrHBGWPFtdfkwwzBJwAI8wvk59Kbjxr8H0xmYujCFXI
	 jz2fdGuav4Vyq07cc06zrWvp+8q9KwwypxzUqgjTCUEvkKXL6pSKAOfiEeelz6p2vm
	 NYQpT3DNs3gfeFvdtZUaonjRhsplgWultrX9HpP4=
Date: Tue, 28 Jul 2026 09:22:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: rtl8723bs: Changing two struct members
Message-ID: <2026072813-canopener-amigo-0c61@gregkh>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260717161329.3400-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717161329.3400-1-fliegbert2@gmail.com>

On Fri, Jul 17, 2026 at 04:13:25PM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> This patch changes two members of the struct adapter.
> Two additional patches ar made to fix some checkpatch warnings.
> 
> Changes in v2:
> - Rebased against staging-testing

Did you forget to test-build this?

drivers/staging/rtl8723bs/core/rtw_mlme.c: In function ‘rtw_scan_abort’:
drivers/staging/rtl8723bs/core/rtw_mlme.c:932:57: error: ‘struct adapter’ has no member named ‘bSurpriseRemoved’; did you mean ‘surprise_removed’?
  932 |                 if (adapter->driver_stopped || adapter->bSurpriseRemoved)
      |                                                         ^~~~~~~~~~~~~~~~
      |                                                         surprise_removed


:(


