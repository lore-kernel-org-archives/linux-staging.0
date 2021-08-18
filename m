Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B663173
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 11:42:28 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 759B924A; Wed, 18 Aug 2021 13:34:24 +0200 (CEST)
Date: Wed, 18 Aug 2021 13:34:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	iommu@lists.linux-foundation.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 13/63] iommu/amd: Use struct_group() for memcpy()
 region
Message-ID: <YRzwP4cuyONqm9CH@8bytes.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-14-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818060533.3569517-14-keescook@chromium.org>

On Tue, Aug 17, 2021 at 11:04:43PM -0700, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Use struct_group() in struct ivhd_entry around members ext and hidh, so
> they can be referenced together. This will allow memcpy() and sizeof()
> to more easily reason about sizes, improve readability, and avoid future
> warnings about writing beyond the end of ext.
> 
> "pahole" shows no size nor member offset changes to struct ivhd_entry.
> "objdump -d" shows no object code changes.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: iommu@lists.linux-foundation.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Joerg Roedel <jroedel@suse.de>

