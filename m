Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21BF279918;
	Wed, 26 Nov 2025 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156775; cv=none; b=h0Wzh0U4G+iYH+9wKVDtfovwMSneRR5+oJ5OyKDQ5z2AnDlNMg6Ol6CL/uNGU52/BNchz8idFbp2yFs10Hm5FcmwbHfqUm4UPIzoBoEs/G59ut3+5f8jAMj8PrsMwjHr8ILzzUE+FZf0gsKT6c1jbRYp72W+4UvSo6VWubYAcOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156775; c=relaxed/simple;
	bh=X6QDP+ClsuFnzoXoQ0p0dtdMoRIwp2UqMw16E5UCtA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaTvnQ9XATatiPlLw4A0LWzR5zlFJfVJa6YmOu3+XZm8AUIDscculnv2O8vl5GUSb3IGAv/goz+wUlqkcDzc04IsUNR2VJUSAswqH6Ym1aVDMq1Zju5VyJE6vt/8oFxGARxKIXqPjckIJC2fP/FDikfv8b2U1VHICVtSqflVkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0/1Q6Vqu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0/1Q6Vqu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CEFC116C6;
	Wed, 26 Nov 2025 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764156775;
	bh=X6QDP+ClsuFnzoXoQ0p0dtdMoRIwp2UqMw16E5UCtA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0/1Q6VquMIoZhRMj++aNZu6g/RxXBRfKV9yxtLI4ld+Vp0D0+Eh3cgWWJRqEHYMv3
	 4ouzKwQoNN+zJslNSq/0KTfc+MNXnT64BUKAlXIAa4Hdw2Lh52LfkbAj9kz51Im3G1
	 Rrmra0WG2vkLemlx9IuqOxzez7oEFl5JofBuH8JM=
Date: Wed, 26 Nov 2025 12:32:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: fix missing cleanup on interface
 registration failure
Message-ID: <2025112643-wife-repose-d923@gregkh>
References: <20251122185656.251902-1-knavaneeth786@gmail.com>
 <sgvpvlvyjl2sd4ehwujuetrtzl5jvvwkk7yxmjourgduylqf2w@g3qosecznvic>
 <de76ebde-3453-4f4f-a0a4-d054121de553@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de76ebde-3453-4f4f-a0a4-d054121de553@gmail.com>

On Tue, Nov 25, 2025 at 09:36:16PM +0530, Navaneeth K wrote:
> Hi Nihaal,
> Thank you for the detailed explanation.
> That makes perfect sense. I wasn’t aware that most_register_interface()
> is intended to handle cleanup via the dev.release path even on failure.
> I will analyze most_register_interface() and prepare a follow-up patch
> to address the inconsistency in the early error paths where put_device()
> is missing, as you suggested.
> 
> Greg, since this version of the patch would introduce a double-free,
> could you please drop it from staging-testing?

Ok, will go drop it now, thanks.

greg k-h
