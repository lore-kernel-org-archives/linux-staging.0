Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776377;
	b=FOGspGqinlYorKKE+0Co4PhqjAgQFh6TahjkOzTa+5iZQ2eGKencRnZYCcNCcoxxmxmO
	 kQNZeReV2z95qeJ7X3BPPNFVL9j6DnZEO1vO4dJbGn1mGRf7slg7GmBVW+w+csO2g7ly3
	 znNfdyZ5qPYstRzpY0oDCBpaBkcCKadR4svAoiuvKiiqwwN1DKYPl9z7T9XSkjmfDTaj0
	 2GkF9DS5tdHI3r/lDhqvrwgz1O1Zj0MukDpU0wNEp4M6BYEfVcn0hGQKWvi8HSuLEigyw
	 tRxgc03Y/3HMkYoccB/RSv3cxyTNZ2EMW1o8ih62oApIcptr/WYALaKNJ0u29vnBgqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776377;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DB4yQCgfJtejeUr2NFz55DShHKw/3MpmmTIh9LFhOyM=;
	b=x9kQJoNYfFKR8OOKwSr+N9gJUBFGAgXyZYGYXaRxfpnWqthgAgQ/LDIAwaFE83C2Q/t1
	 YP4+WR2Asr3soc+H5ZrL1P6tSsfZisyujVl5eX90POMCx04kdleLJTU7G6v7n6YDz9sag
	 mdxeBTB1U7rZNiNhKbm2XPgpQKvd0rj1yqfUUqLPjXSjZozYj+c39KwmAtYC6t++BKU+e
	 hsUMy+Ast1eVxwCZbqKU4POmW1nERQh0p33WUkryC2MRnULP3ELKrY797yEjH7zPyn4A9
	 LJhrvwgeMuYES0z8W07wvC6sqiMMdX9c4LvVTlUV9uVC6ivWrgBkaM4Ada24XR16meg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AH1wHa0o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC69606A328
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AH1wHa0o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343B21F000C1;
	Wed,  4 Nov 2026 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776376;
	bh=DB4yQCgfJtejeUr2NFz55DShHKw/3MpmmTIh9LFhOyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AH1wHa0oBNeG3yBGpwGmnWC2GAt4BmX1mFR1MX2Pac75iczEY4IWHnVYS9pIkKQo+
	 OxMk3n0AOBJR1uvPKqUWSY+83faLYsipKPLb8C3tmxhUaD57h+F0UUs/ZN4gEJlp0U
	 I8UPHZHCpAIZpn7qlWqXaXYizQZZokB8b65I/op7+31NSniia6WkZA39Yb76QR5FLE
	 y/ji9CDWI+eqxCFcgJvC5XtwRCOobAagKRw6lGpdEeG80dnPbiu/ckLRbAf3Telimc
	 Tub9Y6oXuSqORm1FZ1fVJ1GidDAxr79kcGPMIThi+3hfTKjFV0j1c7x3dZIjy5kgp9
	 HcNhDpxJM4TIA==
Date: Wed, 4 Nov 2026 08:12:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: release the port device node in
 cvm_oct_probe
Message-ID: <20261104-provocative-crow-from-ganymede-e0d271@quoll>
References: <20261104021450.1468423-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021450.1468423-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:14:50 +0000, Wentao Liang wrote:
> cvm_oct_probe() looks up the device node of every port with
> cvm_oct_node_for_port(), which walks the children with
> for_each_child_of_node() and therefore returns the node with an
> incremented reference count.  The reference is stored in
> priv->of_node and used for the lifetime of the net_device, but it is
> never dropped: both probe error paths free the net_device without
> releasing the node, and cvm_oct_remove_device() does the same on
> unbind.  Each failed or torn down port therefore keeps its device node
> referenced forever.
> 
> Add the missing of_node_put() in the two probe error paths and in
> cvm_oct_remove_device(), which also covers the error cleanup done after
> the ports have been registered.  of_node_put() accepts the NULL node of
> the POW device.
> 
> Fixes: 422d97b8b05e ("Revert "staging: octeon: delete driver"")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/staging/octeon/ethernet.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




