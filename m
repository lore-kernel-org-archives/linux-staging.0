Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB1E3570A3;
	Wed, 17 Dec 2025 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976660; cv=none; b=R340YzJSvBEpdb5obV6W3bHy/8dqKxJLKqgZG8HM69BTkJfJTqxpQs1+iBwnYkUFt5UDTw5LwBAyQFsJcCvGZjlTzJRSBM+A9lMrFuUGaDzILO4pGdQqpiQp63EsFB8pNhhtRPG/11PX8AECSBy0gIe0tvJoHhGWq4vEZAm23gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976660; c=relaxed/simple;
	bh=zy+0h5kR0ef4iu6jX9sjPh+JgSQzfFIx97sKK3uEe2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dn9UoDBwnaHPuJbv2D+4MEu+AFS/gb0NQF5WhpbMJ80lwYmZhS22gIrPHVdjX2Fet66e8QFDZPrvkHfbTSsduQ8kWbcDkJ/2OSC43KjKGyHokGosmFCTRkGx4nZTcOTWJ3P5ZFyM2ctJTWz52d2Y+p0e/ZraTTKanYJFz1LMt1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Dl8kkLc9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Dl8kkLc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D44CC113D0;
	Wed, 17 Dec 2025 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765976659;
	bh=zy+0h5kR0ef4iu6jX9sjPh+JgSQzfFIx97sKK3uEe2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dl8kkLc9cY6YfBTSvRKzQo0KZs7BAilxYo4UvEINzUf0hxRet6na14gIFuglLdrym
	 c5w8zi1QIG1qQ4d+9oE7s5pfBRR0O4e3apGfUdrhQNjdVrDn324e4iXlb5meFE6fYS
	 MWgJsjXBObfzwaoqOi6Iv8Efdv13Dh1YWWyD2gnI=
Date: Wed, 17 Dec 2025 14:04:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sanghyeon Lee <sanghae778@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces and else
 block
Message-ID: <2025121704-partition-agility-cbe5@gregkh>
References: <20251213161122.4280-1-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213161122.4280-1-sanghae778@gmail.com>

On Sat, Dec 13, 2025 at 04:11:22PM +0000, Sanghyeon Lee wrote:
> This patch fixes coding style issues reported by checkpatch.pl in
> odm_CfoTracking.c.
> 
> The changes include:
> 1. Removing unnecessary braces {} from single-line conditional
>    statements.
> 2. Removing an unnecessary else statement after a return, which reduces
>    indentation  and simplifies the code flow.

That is two different things, so this should be 2 different patches,
right?

thanks,

greg k-h
