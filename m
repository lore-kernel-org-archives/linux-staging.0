Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9927451
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYAruBgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630DFC433C8;
	Tue, 10 Oct 2023 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696952823;
	bh=Gs9ENmC70BtlEVTiCiEVzfq0QWempepVkVcAfg4SrxY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cYAruBgbXU1xRhMhpdCa8E4SWCrBb4XQtJYPK7cfDLcd1ASjOMqz69kN96MclwD+4
	 U7hOdayZxTn0I6wvvASCUV194XYz2Nq0A8RA8zYPH0YXVHzOGEIgSZuf23etN8Ei1t
	 k+S2pC4d+SkOH9HOG4cYa1Lfsexe3naZlCHN5gj+Ck5hT3MUS1b761iNj/+hb34YIu
	 yXoJssRxIvtuI+CsGsj68A0aYD/drSUygU+hB7h4T18whk5Rnu37sZGTvmlLeEmIe7
	 zSbhwGvpDAPxom/ZqknULoHBQgIQ9bjnMdikm/CtLqMx6Glo/E11rYWCSpkxI3/qWw
	 apBdeHepc5AAA==
Date: Tue, 10 Oct 2023 16:47:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, Michael
 Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/17] staging: iio: resolver: ad2s1210: add
 triggered buffer support
Message-ID: <20231010164714.2b949a16@jic23-huawei>
In-Reply-To: <20231005-ad2s1210-mainline-v4-6-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
	<20231005-ad2s1210-mainline-v4-6-ec00746840fc@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Oct 2023 19:50:23 -0500
David Lechner <dlechner@baylibre.com> wrote:

> This adds support for triggered buffers to the AD2S1210 resolver driver.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Applied.

