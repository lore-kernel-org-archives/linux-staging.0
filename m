Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830811FA4
	for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 08:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECACC433C0;
	Fri, 23 Jun 2023 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687508300;
	bh=JCFIGYLHdPDTxnWe0rqNvIgH7ZUiUB4HgWHe9auF49o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rR1rNCnuPhJ2OZH1ja/OSyX2834u6LlwMMxzxtxErn2vlAV4HcN6TCJ2lhlYjA/ez
	 fIy8wVh27SboStti2YpZVRNnXgJ9BdeOetRCIv8GNfoJwq40IhQhjubc1xRDfIL2fT
	 vtH6nRfq0SfQ3ojBmzlEl5Vx+8Es5TTaeYxbiD80=
Date: Fri, 23 Jun 2023 10:18:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Franziska Naepelt <franziska.naepelt@googlemail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	eperi1024@gmail.com, hdegoede@redhat.com, quic_vjakkam@quicinc.com,
	johannes.berg@intel.com, tegongkang@gmail.com,
	Franziska Naepelt <franziska.naepelt@gmail.com>
Subject: Re: [PATCH v2 0/5] Fix some checkpatch issues
Message-ID: <2023062306-reload-squeezing-633a@gregkh>
References: <20230621184635.25064-1-franziska.naepelt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621184635.25064-1-franziska.naepelt@gmail.com>

On Wed, Jun 21, 2023 at 08:46:35PM +0200, Franziska Naepelt wrote:
> This is a series of patches to fix some trivial checkpatch issues. Not all
> issues have been fixed. I intend to submit another series to fix more stuff.

None of these apply to my staging-next branch :(
