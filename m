Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B14D2F81
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dRzGSSNRpz+eFzH2So2ubKBvMje2zZTAEujED4XgJ/A=; b=cONTAs1f8SM90mxQ+xn7aZBJEz
	ZB+5o8m2aPzm6QanM+Jrbm3O0Kh2JwvtUC6otyn/AP0ZS5PxUxHSK3jK8yFxzlRYU/w3C/Vf+EnbJ
	HgyOumHIQJ0YRrkd/XYygZoE1vE34hnc7Kd6uCW47XYJvoWpRvXbhnCbD8zwDJW6bVj7sFVS1dFg7
	8w6lXL900xGpbrXunim5UE1K7cCdXdyhum3VTvJHYt4NG0vXdsUnJW5kZnUFAeDBdcEZbcXd71WG7
	T5eucAm13curkj/KT24LbNYdehoqSQKxDPaYXpnXKN1KV1cXu/YBYZNzqc4t9tOh9N9p5h24ctKY9
	O6Dp+/Ug==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZChO-00GYcv-1O; Wed, 21 Apr 2021 13:15:40 +0000
Date: Wed, 21 Apr 2021 14:15:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210421131522.GI3596236@casper.infradead.org>
References: <20210421123718.GA4597@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421123718.GA4597@focaruja>

On Wed, Apr 21, 2021 at 09:37:18AM -0300, Aline Santana Cordeiro wrote:
> -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> -    u32 mbus_code);
> +const struct atomisp_format_bridge *
> +get_atomisp_format_bridge_from_mbus(u32 mbus_code);

As I said, better to break the 80 column rule than do this.

