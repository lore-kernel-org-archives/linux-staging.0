Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A77173
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 09:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6B8C340E1;
	Mon, 24 Jan 2022 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643017935;
	bh=vUoWMLoJ92jY8f9yzXk9E50pdajanomuGshJBU59A4E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LXYS0GE/zE7/ge6zIktXJJ2WEme0o/EO/JSJEqu9xGNgkXM0OKdoIHmaMtMtCV6O3
	 Wx05j9EKD/t2s7iPMBRsNWEjH7k93sYdtXNgD9YY1X04NrOSh1HI6Hubf1K6h5zr/U
	 kWhGwYEveeRhYSwiPGHe8DUWCRtiVGug9zH9aU7xnMBeV8o5T+ogyJBVs1q8PyQAGm
	 JcYgDkuqbK/gRvL0UBZv21x27+MmgaOMF65Y264P5o3Rnpe6UrpjaM36XSJW8L9rMv
	 yJp1rmQF5v12GbNE37V5a+C1B3x7Kh3rdJMM4dkQqMIPZXJYc8zrnyPSXzhsYEI/YH
	 mZiCW7fIiDotw==
Message-ID: <02eed426fbd5533b446d1d82db1eb973107e93f7.camel@kernel.org>
Subject: Re: [PATCH 00/18] staging: vchiq_arm: minor adjustments
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com, Phil Elwell
 <phil@raspberrypi.com>,  Gaston Gonzalez <gascoar@gmail.com>,
 linux-staging@lists.linux.dev
Date: Mon, 24 Jan 2022 10:52:10 +0100
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2022-01-23 at 21:02 +0100, Stefan Wahren wrote:
> This is a loose collection of small adjustments to the VCHIQ code 
> (mostly coding style, but also bugfixes).
> 
> Stefan Wahren (18):
>   staging: vchiq_core: fix indentation in vchiq_log_dump_mem
>   staging: vchiq_debugfs: get the rid of n_log_entries
>   staging: vchiq_arm: introduce is_adjacent_block
>   staging: vchiq: convert TODOs into unordered list
>   staging: vchiq: drop completed tasks from TODO
>   staging: vchiq: add message handling to TODO list
>   staging: vchiq_core: fix type of parameter localport
>   staging: vchiq_core: simplify vchiq_add_service_internal
>   staging: vchiq_core: align return statements in msg_type_str
>   staging: vchiq_core: drop prefix of vchiq_set_service_state
>   staging: vchiq_core: reduce multi-line statements
>   staging: vchiq_core: fix alignment
>   staging: vchiq_core: avoid ternary operator for set_service_state
>   staging: vchiq_core: use min_t macro
>   staging: vchiq_arm: make vchiq_get_state return early
>   staging: vchiq_arm: Avoid NULL ptr deref in
>     vchiq_dump_platform_instances
>   staging: vchiq_core: handle NULL result of find_service_by_handle
>   staging: vchiq_dev: Avoid unnecessary alloc in
>     vchiq_ioc_create_service


For the whole series:

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks!
Nicolas
