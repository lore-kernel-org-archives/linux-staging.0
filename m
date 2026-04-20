Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E091383C8B;
	Mon, 20 Apr 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679543; cv=none; b=WAEERKwQtsDQ1dYx9WgO/CcyMzxkjAfuamTE3V6mm/ENiTgDBXxk48juxaJpnGmXDAf2ZybT8LEP0Ej/4UPXecsXnGvWYIjp7v4aNOkV1dbuJ0s0usOhoey4eyIv16J8h1sQFe7JN1WxQ1rIzUMz+45iJ+YRCzOMlE7rpmkwIvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679543; c=relaxed/simple;
	bh=jqnlO8cKlV2D0eWI4bDte4Wip05dKPWY4noUOGqmZZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3gEl/l20cKmrwB/9HxLBeZoXASuu3jyl75mRrE3Xn5kcFAvAZ9uQsJ7CUXtrIL2DSQvkE+GeOsP+i6Kz2zRSxKnWv8lu/5P9lhfWxZ8qUxua02Ptiwncz7EAkyRyhvU9HB0jfCzcjjPqhguf+/h5TTbR33QWkdm3v7sVIVp1sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dXYxmeo/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dXYxmeo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F826C19425;
	Mon, 20 Apr 2026 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776679542;
	bh=jqnlO8cKlV2D0eWI4bDte4Wip05dKPWY4noUOGqmZZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXYxmeo/G5pqttq/juSgY2i2e2uP3PKYjnnBkXTVRKrPl/hDm07IEpEktRx6atvYe
	 ZrZ5pIF3GRiztwTEet55O5sywtFU0syDrXlPDdZ9+EcgXHoQzPQy1+2Cs1MF4GkKCe
	 WQldQrodJuP+nNhb35TXbmqDnvoo95rjl123oIns=
Date: Mon, 20 Apr 2026 12:05:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Minu Jin <s9430939@naver.com>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>, Ijae Kim <ae878000@gmail.com>,
	Taegyu Kim <tmk5904@psu.edu>
Subject: Re: [PATCH v1] staging: rtl8723bs: fix stale recv_frame free in
 recv_func_posthandle()
Message-ID: <2026042006-deploy-cause-dc65@gregkh>
References: <20260420042734.3685-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420042734.3685-1-dbgh9129@gmail.com>

On Mon, Apr 20, 2026 at 12:27:34AM -0400, Yuho Choi wrote:
> recv_func_posthandle() saved the original recv_frame pointer before
> calling recvframe_chk_defrag().
> 
> On the last-fragment reassembly path, recvframe_chk_defrag() may return
> the first fragment as the new frame while freeing the original
> last-fragment frame when draining the defrag queue.
> 
> If process_recv_indicatepkts() then fails, recv_func_posthandle() frees
> the saved pre-defrag pointer again, which can result in a stale pointer
> free.
> 
> Free the current recv_frame on the failure path instead of the saved
> pre-defrag pointer.

Can you cause this to happen in any way?  Given the age of this code,
and the crazy paths here, I'm loath to change this without lots of
testing with a real device, have you done so?

thanks,

greg k-h
