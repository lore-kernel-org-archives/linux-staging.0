Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0708C71
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 08:38:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3716060C3F;
	Mon, 26 Apr 2021 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619426307;
	bh=J2dPSKVDtJICCS4x6dgDTO/htnYrFcOppNyXyyfspMk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nppGp0OmssiJ0PHa/XW4b4CSHXlkJry4OAZruT6er6iZDp7wq2qAaKssi0frSr0bX
	 VSOA1z9iYskU7M9oVq85QNYvcqsQoEM5rG2hcv4J1kdHmNkCohpb36iAC4rAML8qzE
	 YnwCZEwD6+g8enIJ5Uojh01F6Ur/HG8KN+Kh3gpJvekkqUncuMBCpaifEFalU9qPUS
	 7u2JFo8ASNrdJi+PlKrGrYUl3jRXRgjjU09jRK0fKuiT+2yEclhm/sS6bEFDLuWjNT
	 PhaYqP50RQ8tp01I4sseRRX9G/85AFOY44OXyq8YEZ/npMrwGvxcJpvYmjiOiWvrod
	 XZZwZV+wAE1Bw==
Message-ID: <8b8f198129cc59b6b246422599db5064700754be.camel@kernel.org>
Subject: Re: [PATCH V2 04/11] staging: vchiq_core: introduce get_bulk_reason
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev
Date: Mon, 26 Apr 2021 10:38:23 +0200
In-Reply-To: <1619347863-16080-5-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
	 <1619347863-16080-5-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-04-25 at 12:50 +0200, Stefan Wahren wrote:
> Nesting multiple ternary operators over multiple lines isn't easy to
> read. Move this logic into a separate inline function.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

